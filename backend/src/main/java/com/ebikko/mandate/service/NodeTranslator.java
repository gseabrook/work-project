package com.ebikko.mandate.service;

import com.google.common.base.Predicate;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.NodeType;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;

import static com.google.common.collect.Collections2.filter;
import static com.google.common.collect.Lists.newArrayList;
import static org.springframework.beans.BeanUtils.getPropertyDescriptor;


public class NodeTranslator {

    private final static Log logger = LogFactory.getLog(NodeTranslator.class);
    private final static ArrayList<Class<?>> BASIC_TYPES = newArrayList(NodeTranslator.class, String.class);

    public Node translate(Object o, Session session) throws EbikkoException, IllegalAccessException, InvocationTargetException {
        logger.debug("Translating " + o.getClass() + " to node");

        Entity nodeTypeAnnotation = o.getClass().getAnnotation(Entity.class);

        if (nodeTypeAnnotation == null) {
            throw new IllegalArgumentException("Can only convert objects with an entity annotation");
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

            if (isEntity(value)) {
                node.setValue(propertyName, translate(value, session));
            } else if (BASIC_TYPES.contains(value.getClass())) {
                logger.debug("Setting value " + value + " for property " + propertyName);
                node.setValue(propertyName, value);
            } else {
                logger.error("Error: Can't handle type " + value.getClass());
            }
        }

        logger.debug("Finished translating " + o.getClass() + " to node");
        return node;
    }

    private Object getValue(Object o, Field field) throws IllegalAccessException, InvocationTargetException {
        PropertyDescriptor propertyDescriptor = getPropertyDescriptor(o.getClass(), field.getName());
        if (propertyDescriptor == null) {
            logger.error("Error: Can't find property descriptor for field " + field.getName() + " on " + o.getClass());
        }

        Method readMethod = propertyDescriptor.getReadMethod();
        if (readMethod == null) {
            logger.error("Error: Can't find read method for field " + field.getName() + " on " + o.getClass());
        }
        return readMethod.invoke(o);
    }

    private boolean isEntity(Object o) {
        return o.getClass().getAnnotation(Entity.class) != null;
    }
}
