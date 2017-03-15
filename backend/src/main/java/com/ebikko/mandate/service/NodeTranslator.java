package com.ebikko.mandate.service;

import com.ebikko.mandate.model.DisplayEnum;
import com.ebikko.mandate.model.ReferenceData;
import com.google.common.base.Predicate;
import ebikko.*;
import ebikko.filter.Equals;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import static com.google.common.collect.Collections2.filter;
import static com.google.common.collect.Lists.newArrayList;
import static java.lang.String.format;
import static java.util.Collections.emptyList;
import static org.apache.commons.lang3.reflect.FieldUtils.getFieldsWithAnnotation;
import static org.springframework.beans.BeanUtils.getPropertyDescriptor;

@Service
public class NodeTranslator {

    private final static Log logger = LogFactory.getLog(NodeTranslator.class);
    private final static ArrayList<Class<?>> BASIC_TYPES = newArrayList(NodeTranslator.class, String.class);

    public Node translate(Object o, final Session session) throws EbikkoException {
        logger.debug("Translating " + o.getClass() + " to node");

        Entity nodeTypeAnnotation = o.getClass().getAnnotation(Entity.class);

        if (nodeTypeAnnotation == null) {
            throw new IllegalArgumentException("Can only convert objects with an entity annotation");
        }

        if (o.getClass().getAnnotation(ReferenceData.class) != null) {
            return loadReferenceFromDatabase(session, o);
        }

        String nodeType = nodeTypeAnnotation.name();

        NodeType nodeTypeByName = session.getNodeTypeByName(nodeType);
        Node node = new Node(nodeTypeByName);

        ArrayList<Field> fields = newArrayList(filter(newArrayList(o.getClass().getDeclaredFields()), new Predicate<Field>() {
            public boolean apply(Field field) {
                return field.getAnnotation(Column.class) != null;
            }
        }));

        for (Field field : fields) {
            Column annotation = field.getAnnotation(Column.class);
            String propertyName = annotation.name();

            logger.debug("Field: " + field.getName() + ", propertyName: " + propertyName);

            Object value = getValue(o, field);

            if (value == null) {
                continue;
            }

            if (isEntity(value)) {
                node.setValue(propertyName, translate(value, session));
            } else if (BASIC_TYPES.contains(value.getClass())) {
                logger.debug("Setting value " + value + " for property " + propertyName);
                node.setValue(propertyName, value);
            } else if (List.class.isAssignableFrom(value.getClass())) {
                List list = newArrayList();
                List valueList = (List) value;
                for (Object val : valueList) {
                    logger.debug("Translating element " + (valueList).indexOf(val));
                    list.add(translate(val, session));
                }
                node.setValue(propertyName, list);
            } else if  (DisplayEnum.class.isAssignableFrom(value.getClass())) {
                String displayValue = ((DisplayEnum) value).getDisplayValue();
                logger.debug("Setting value " + displayValue + " for property " + propertyName);
                node.setValue(propertyName, displayValue);
            } else {
                logger.error("Error: Can't handle type " + value.getClass());
            }
        }

        logger.debug("Finished translating " + o.getClass() + " to node");
        return node;
    }

    private Node loadReferenceFromDatabase(Session session, Object o) throws EbikkoException {
        Entity nodeTypeAnnotation = o.getClass().getAnnotation(Entity.class);
        String nodeType = nodeTypeAnnotation.name();

        Field[] fieldsWithAnnotation = getFieldsWithAnnotation(o.getClass(), Id.class);
        if (fieldsWithAnnotation.length != 1) {
            throw new EbikkoException("Error: Reference entities must have exactly 1 field annotated with Id");
        }

        Field idField = fieldsWithAnnotation[0];
        Column column = idField.getAnnotation(Column.class);

        if (column == null) {
            throw new EbikkoException("Error: Id column must have an accompanying column annotation");
        }

        Property property = session.getPropertyByName(column.name());
        Object idValue = getValue(o, idField);
        Filter filter = new Equals(property, idValue);

        NodeType idNodeType = session.getNodeTypeByName(nodeType);
        MultiQuery query = new MultiQuery(session, "Search", newArrayList(idNodeType), filter, emptyList(), 1);
        query.execute();

        if (query.getCount() == 0) {
            throw new EbikkoException(format("Error: Count not find %s by searching for property: %s, value: %s", nodeType, property.getName(), idValue));
        }

        return query.get(0);
    }

    private Object getValue(Object o, Field field) throws EbikkoException {
        PropertyDescriptor propertyDescriptor = getPropertyDescriptor(o.getClass(), field.getName());
        if (propertyDescriptor == null) {
            logger.error("Error: Can't find property descriptor for field " + field.getName() + " on " + o.getClass());
        }

        Method readMethod = propertyDescriptor.getReadMethod();
        if (readMethod == null) {
            logger.error("Error: Can't find read method for field " + field.getName() + " on " + o.getClass());
        }
        try {
            return readMethod.invoke(o);
        } catch (Exception e) {
            throw new EbikkoException(e.getMessage(), e);
        }
    }

    private boolean isEntity(Object o) {
        if (o == null) {
            return false;
        }
        return o.getClass().getAnnotation(Entity.class) != null;
    }
}
