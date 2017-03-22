package com.ebikko.mandate.service.translator;

import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.model.MerchantBankAccount;
import com.google.common.base.Function;
import ebikko.EbikkoException;
import ebikko.Node;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NodeMerchantBankAccountTranslator implements Function<Node, MerchantBankAccount> {

    private final NodeBankTranslator nodeBankTranslator;

    @Autowired
    public NodeMerchantBankAccountTranslator(NodeBankTranslator nodeBankTranslator) {
        this.nodeBankTranslator = nodeBankTranslator;
    }

    @Override
    public MerchantBankAccount apply(final Node input) {
        try {
            String id = input.getUid();
            String accountNumber = (String) input.getValue("Merchant Account No");
            String sellerId = (String) input.getValue("Seller ID");

            Node bankNode = (Node) input.getValue("Bank Name");
            Bank bank = nodeBankTranslator.apply(bankNode);

            return new MerchantBankAccount(id, bank, accountNumber, sellerId);
        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }
}
