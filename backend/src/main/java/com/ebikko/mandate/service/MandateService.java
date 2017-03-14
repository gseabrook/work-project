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

@Service
public class MandateService {

    private final SessionService sessionService;

    @Autowired
    public MandateService(SessionService sessionService) {
        this.sessionService = sessionService;
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
                mandateNode.setValue("ID Type", customer.getId().getType().getDisplayValue());
                mandateNode.setValue("ID Number", customer.getId().getValue());

                mandateNode.setValue("Maximum Amount", mandate.getAmount());
                mandateNode.setValue("Frequency", mandate.getFrequency().getDisplayValue());
                mandateNode.setValue("Registration Date", mandate.getRegistrationDate());
                mandateNode.setValue("Reference Number", mandate.getReferenceNumber());

                mandateNode.save();
                // Effective Date
                // Customer Details

                return null;
            }
        });
    }
}
