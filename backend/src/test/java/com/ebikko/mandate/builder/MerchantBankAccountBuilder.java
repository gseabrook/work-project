package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.MerchantBankAccount;

import static com.ebikko.mandate.builder.BankBuilder.exampleBank;

public class MerchantBankAccountBuilder {
    public static MerchantBankAccount exampleMerchantBankAccount() {
        return new MerchantBankAccount(exampleBank(), "11111", "ABAW14234");
    }
}
