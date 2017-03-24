package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.service.translator.NodeBankTranslator;
import ebikko.EbikkoException;
import ebikko.Node;
import ebikko.NodeType;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.ebikko.mandate.model.Bank.BANK_NODE_TYPE;
import static com.google.common.collect.Collections2.transform;
import static com.google.common.collect.Lists.newArrayList;

@Service
public class BankService {

    private final SessionService sessionService;
    private final NodeBankTranslator nodeBankTranslator;

    @Autowired
    public BankService(SessionService sessionService, NodeBankTranslator nodeBankTranslator) {
        this.sessionService = sessionService;
        this.nodeBankTranslator = nodeBankTranslator;
    }

    public List<Bank> getBanks() {
        try {
            return sessionService.performSessionAction(new SessionAction<List<Bank>>() {
                @Override
                public List<Bank> perform(Session session) throws EbikkoException {
                    NodeType bankNodeType = session.getNodeTypeByName(BANK_NODE_TYPE);
                    List<Node> bankNodes = session.getAllNodes(bankNodeType.getUid());
                    return newArrayList(transform(bankNodes, nodeBankTranslator));
                }
            });
        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }
}
