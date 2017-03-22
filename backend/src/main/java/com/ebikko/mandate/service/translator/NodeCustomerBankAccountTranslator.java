package com.ebikko.mandate.service.translator;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.model.CustomerBankAccount;
import com.google.common.base.Function;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NodeCustomerBankAccountTranslator implements Function<Node, CustomerBankAccount> {

    private final EntityTranslator entityTranslator;
    private final SessionService sessionService;
    private final NodeBankTranslator nodeBankTranslator;

    @Autowired
    public NodeCustomerBankAccountTranslator(EntityTranslator entityTranslator, SessionService sessionService, NodeBankTranslator nodeBankTranslator) {
        this.entityTranslator = entityTranslator;
        this.sessionService = sessionService;
        this.nodeBankTranslator = nodeBankTranslator;
    }

    @Override
    public CustomerBankAccount apply(final Node input) {
        try {
            return sessionService.performSessionAction(new SessionAction<CustomerBankAccount>() {
                @Override
                public CustomerBankAccount perform(Session session) throws EbikkoException {
                    String id = input.getUid();
                    String accountNumber = (String) input.getValue("Account Number");

                    Node bankNode = (Node) input.getValue("Bank Name");
                    Bank bank = nodeBankTranslator.apply(bankNode);

                    return new CustomerBankAccount(id, bank, accountNumber);
                }
            });

        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }
}
