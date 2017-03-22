package com.ebikko.mandate.service;

import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;

@Service
public class NodeService {

    private final EntityService entityService;

    @Autowired
    public NodeService(EntityService entityService) {
        this.entityService = entityService;
    }

    public Node getNode(Session session, Object o) throws EbikkoException {
        if (o instanceof String) {
            return getNode(session, (String) o);
        }
        Field idField = entityService.getIdField(o.getClass());
        Object value = entityService.getValue(o, idField);
        return getNode(session, (String) value);
    }

    public Node getNode(Session session, String idValue) throws EbikkoException {
        return session.getNode(idValue);
    }

}
