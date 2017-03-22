package com.ebikko.mandate.service.translator;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Bank;
import com.google.common.base.Function;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NodeBankTranslator implements Function<Node, Bank> {

    private final SessionService sessionService;

    @Autowired
    public NodeBankTranslator(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    @Override
    public Bank apply(final Node input) {
        try {
            return sessionService.performSessionAction(new SessionAction<Bank>() {
                @Override
                public Bank perform(Session session) throws EbikkoException {
                    String id = input.getUid();
                    String bankCode = (String) input.getValue("Bank Code");
                    String name = (String) input.getValue("Name of the Bank");
                    return new Bank(id, bankCode, name);
                }
            });

        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }
}
