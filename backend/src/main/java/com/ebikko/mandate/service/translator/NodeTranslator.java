package com.ebikko.mandate.service.translator;

import com.ebikko.mandate.model.DisplayEnum;
import com.ebikko.mandate.model.ReferenceData;
import com.ebikko.mandate.service.EntityService;
import com.ebikko.mandate.service.NodeService;
import com.google.common.base.Predicate;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.NodeType;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import static com.google.common.collect.Collections2.filter;
import static com.google.common.collect.Lists.newArrayList;

@Service
public class NodeTranslator {

    private final static Log logger = LogFactory.getLog(NodeTranslator.class);
    private final static ArrayList<Class<?>> BASIC_TYPES = newArrayList(NodeTranslator.class, String.class);
    private final NodeService nodeService;
    private final EntityService entityService;

    public NodeTranslator(NodeService nodeService, EntityService entityService) {
        this.nodeService = nodeService;
        this.entityService = entityService;
    }

    public Node translate(Object o, final Session session) throws EbikkoException {
        logger.debug("Translating " + o.getClass() + " to node");

        Entity nodeTypeAnnotation = o.getClass().getAnnotation(Entity.class);

        if (nodeTypeAnnotation == null) {
            throw new IllegalArgumentException("Can only convert objects with an entity annotation (" + o.getClass() + ")");
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

            Object value = entityService.getValue(o, field);

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
                    if (val != null) {
                        logger.debug("Translating element " + (valueList).indexOf(val));
                        list.add(translate(val, session));
                    }
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

        Class<?> aClass = o.getClass();
        Field idField = entityService.getIdField(aClass);
        Object idValue = entityService.getValue(o, idField);

        return nodeService.getNode(session, idValue);
    }

    private boolean isEntity(Object o) {
        if (o == null) {
            return false;
        }
        return o.getClass().getAnnotation(Entity.class) != null;
    }
}
