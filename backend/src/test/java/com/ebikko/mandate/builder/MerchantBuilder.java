package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.MerchantBankAccount;

import static com.ebikko.mandate.builder.MerchantBankAccountBuilder.exampleMerchantBankAccount;
import static com.google.common.collect.Lists.newArrayList;

public class MerchantBuilder {

    public static Merchant exampleMerchant(MerchantBankAccount merchantBankAccount) {
        return new Merchant(4l, "Ag-I Solutions", "WP010101334", newArrayList(merchantBankAccount));
    }

    public static Merchant exampleMerchant() {
        return exampleMerchant(exampleMerchantBankAccount());
    }
}
