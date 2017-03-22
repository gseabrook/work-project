package com.ebikko.mandate.service.translator;

import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.MerchantBankAccount;
import com.google.common.base.Function;
import ebikko.EbikkoException;
import ebikko.Node;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.google.common.collect.Collections2.filter;
import static com.google.common.collect.Collections2.transform;
import static com.google.common.collect.Lists.newArrayList;

@Service
public class NodeMerchantTranslator implements Function<Node, Merchant> {

    private final NodeMerchantBankAccountTranslator nodeMerchantBankAccountTranslator;

    @Autowired
    public NodeMerchantTranslator(NodeMerchantBankAccountTranslator nodeMerchantBankAccountTranslator) {
        this.nodeMerchantBankAccountTranslator = nodeMerchantBankAccountTranslator;
    }

    @Override
    public Merchant apply(Node input) {
        try {
            String id = input.getUid();
            String companyRegistrationNo = (String) input.getValue("Company Registration No");
            String companyName = (String) input.getValue("Company Name");
            List<Node> bankAccountNodes = (List<Node>) input.getValue("Merchant Bank Account");

            ArrayList<MerchantBankAccount> merchantBankAccounts = newArrayList(
                    transform(filter(bankAccountNodes, new NotNullPredicate()), nodeMerchantBankAccountTranslator)
            );

            return new Merchant(id, companyName, companyRegistrationNo, merchantBankAccounts);
        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }
}
