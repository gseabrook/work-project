package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;

import static com.ebikko.mandate.model.Mandate.MANDATE_NODE_TYPE;

@Service
public class NodeService {

    private final EntityService entityService;
    private final SessionService sessionService;

    @Autowired
    public NodeService(EntityService entityService, SessionService sessionService) {
        this.entityService = entityService;
        this.sessionService = sessionService;
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

    public void saveNode(final Mandate mandate) throws EbikkoException {
        sessionService.performSessionAction(new SessionAction<Void>() {
            @Override
            public Void perform(Session session) throws EbikkoException {
                Node mandateNode = new Node(session.getNodeTypeByName(MANDATE_NODE_TYPE));

                Customer customer = mandate.getCustomer();
                mandateNode.setValue("Name", customer.getName());
                mandateNode.setValue("Email", customer.getEmailAddress());
                mandateNode.setValue("Phone Number", customer.getPhoneNumber());
                mandateNode.setValue("ID Type", customer.getIdType().getDisplayValue());
                mandateNode.setValue("ID Number", customer.getIdValue());

                mandateNode.setValue("Maximum Amount", mandate.getAmount());
                mandateNode.setValue("Frequency", mandate.getFrequency().getDisplayValue());
                mandateNode.setValue("Registration Date", mandate.getRegistrationDate());
                mandateNode.setValue("Reference Number", mandate.getReferenceNumber());

                Node merchantInformation = getNode(session, mandate.getMerchant());
                mandateNode.setValue("Merchant", merchantInformation);

                mandateNode.save();
                // Effective Date

                return null;
            }
        });
    }

}
