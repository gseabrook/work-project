package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.MerchantBankAccount;

import static com.ebikko.mandate.builder.BankBuilder.exampleBank;

public class MerchantBuilder {

    public static Merchant exampleMerchant() {

        MerchantBankAccount bankAccount = new MerchantBankAccount(exampleBank(), "11111", "ABAW14234");

        Merchant merchant = new Merchant("Ag-I Solutions", "WP010101334", bankAccount);
        merchant.setId("c22816ad803c47ed83400bc787d06ed4-cf4ad5cb478c4c36a3dec97e16d81091");
        return merchant;
    }
}
