package com.ebikko.mandate.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.persistence.Id;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

import static org.apache.commons.lang3.reflect.FieldUtils.getFieldsWithAnnotation;
import static org.springframework.beans.BeanUtils.getPropertyDescriptor;

@Service
public class EntityService {

    private static final Log logger = LogFactory.getLog(EntityService.class);

    public Field getIdField(Class clazz) {
        Field[] fieldsWithAnnotation = getFieldsWithAnnotation(clazz, Id.class);
        if (fieldsWithAnnotation.length != 1) {
            throw new RuntimeException("Error: Reference entities must have exactly 1 field annotated with Id (" + clazz + ")");
        }

        return fieldsWithAnnotation[0];
    }

    public Object getValue(Object o, Field field) {
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
            throw new RuntimeException(e.getMessage(), e);
        }
    }
}
