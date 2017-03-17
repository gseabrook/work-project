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

import java.util.List;

@Service
public class MandateService {

    private final SessionService sessionService;
    private final NodeTranslator nodeTranslator;

    @Autowired
    public MandateService(SessionService sessionService, NodeTranslator nodeTranslator) {
        this.sessionService = sessionService;
        this.nodeTranslator = nodeTranslator;
    }

    public void save(final Mandate mandate) throws EbikkoException {
        sessionService.performSessionAction(new SessionAction<Void>() {
            @Override
            public Void perform(Session session) throws EbikkoException {
                Node mandateNode = new Node(session.getNodeTypeByName(Mandate.MANDATE_NODE_TYPE));

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

                mandateNode.save();
                // Effective Date

                Node customerNode = nodeTranslator.translate(customer, session);
                Node bankAccount = ((List<Node>) customerNode.getValue("Customer Bank Account")).get(0);
                bankAccount.save();

                customerNode.save();

                return null;
            }
        });
    }
}
