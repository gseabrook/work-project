package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.CustomerBankAccount;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

import static com.ebikko.mandate.model.Mandate.MANDATE_NODE_TYPE;

@Service
public class NodeService {

    private final SessionService sessionService;

    @Autowired
    public NodeService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    public void saveNode(final Mandate mandate) {
        try {
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

                    CustomerBankAccount customerBankAccount = mandate.getCustomerBankAccount();
                    if (customerBankAccount != null) {
                        mandateNode.setValue("Name of the Bank", customerBankAccount.getBank().getName());
                        mandateNode.setValue("Bank Account Number", customerBankAccount.getAccountNumber());
                    }

                    mandateNode.setValue("Maximum Amount", mandate.getAmount());
                    mandateNode.setValue("Frequency", mandate.getFrequency().getDisplayValue());
                    mandateNode.setValue("Registration Date", mandate.getRegistrationDate());
                    mandateNode.setValue("Effective Date", new Date());
                    mandateNode.setValue("Reference Number", mandate.getReferenceNumber());

                    Merchant merchant = mandate.getMerchant();
                    mandateNode.setValue("Company Name", merchant.getCompanyName());
                    mandateNode.setValue("Company Registration No", merchant.getCompanyRegistrationNumber());

                    mandateNode.save();

                    return null;
                }
            });
        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }

}
