package com.ebikko.mandate.service.translator;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.CustomerBankAccount;
import com.ebikko.mandate.model.IDType;
import com.google.common.base.Function;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

@Service
public class NodeCustomerTranslator implements Function<Node, Customer> {

    private static final Log logger = LogFactory.getLog(NodeCustomerTranslator.class);

    private final EntityTranslator entityTranslator;
    private final SessionService sessionService;
    private final NodeCustomerBankAccountTranslator nodeCustomerBankAccountTranslator;

    @Autowired
    public NodeCustomerTranslator(EntityTranslator entityTranslator, SessionService sessionService, NodeCustomerBankAccountTranslator nodeCustomerBankAccountTranslator) {
        this.entityTranslator = entityTranslator;
        this.sessionService = sessionService;
        this.nodeCustomerBankAccountTranslator = nodeCustomerBankAccountTranslator;
    }

    @Override
    public Customer apply(final Node input) {
        try {
            return sessionService.performSessionAction(new SessionAction<Customer>() {
                @Override
                public Customer perform(Session session) throws EbikkoException {
                    String id = input.getUid();
                    String name = (String) input.getValue("Customer Name");
                    String emailAddress = (String) input.getValue("Email");
                    String phoneNumber = (String) input.getValue("Phone Number");
                    String idValue = (String) input.getValue("ID Number");
                    IDType idType = IDType.fromDisplayValue((String) input.getValue("ID Type"));

                    List<Node> bankAccountNodes = (List<Node>) input.getValue("Customer Bank Account");
                    ArrayList<CustomerBankAccount> bankAccountArrayList = newArrayList();
                    for (Node bankAccountNode : bankAccountNodes) {
                        if (bankAccountNode != null) {
                            bankAccountArrayList.add(nodeCustomerBankAccountTranslator.apply(bankAccountNode));
                        } else {
                            logger.warn("Ignoring null bank account for Customer: " + name + " / uid: " + id);
                        }
                    }

                    return new Customer(id, name, emailAddress, phoneNumber, idValue, idType, bankAccountArrayList);
                }
            });

        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }
}
