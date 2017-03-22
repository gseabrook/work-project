package com.ebikko.mandate.service.translator;

import com.google.common.base.Predicate;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.ReflectionUtils;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.lang.reflect.Field;
import java.util.ArrayList;

import static com.google.common.collect.Collections2.filter;
import static com.google.common.collect.Lists.newArrayList;
import static org.apache.commons.lang3.reflect.FieldUtils.getFieldsWithAnnotation;

@Service
public class EntityTranslator {

    private static final Log logger = LogFactory.getLog(EntityTranslator.class);

    public <T> T translate(Session session, String idValue, Class<T> type) {
        logger.debug("Translating " + type.getClass() + " from id '" + idValue + "'");

        Entity nodeTypeAnnotation = type.getAnnotation(Entity.class);

        if (nodeTypeAnnotation == null) {
            throw new IllegalArgumentException("Can only convert objects with an entity annotation");
        }

        Node node;
        try {
            node = session.getNode(idValue);
            return translate(node, type);
        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }

    private <T> T instantiateTarget(Class<T> type) {
        T target;
        try {
            target = type.newInstance();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return target;
    }

    public <T> T translate(Node node, Class<T> type) throws EbikkoException {
        T target = instantiateTarget(type);

        Field[] fieldsWithAnnotation = getFieldsWithAnnotation(type, Id.class);
        if (fieldsWithAnnotation.length != 1) {
            throw new IllegalArgumentException("Can only convert objects with ID annotation");
        }

        ReflectionUtils.setField(fieldsWithAnnotation[0], target, node.getUid());

        ArrayList<Field> fields = newArrayList(filter(newArrayList(type.getDeclaredFields()), new Predicate<Field>() {
            public boolean apply(Field field) {
                return field.getAnnotation(Column.class) != null;
            }
        }));

        for (Field field : fields) {
            String propertyName = field.getAnnotation(Column.class).name();
            Object value = node.getValue(propertyName);

            ReflectionUtils.setField(field, target, value);
        }

        return target;
    }
}
