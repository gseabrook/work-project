package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Bank;

public class BankBuilder {

    public static Bank exampleBank() {
        return new Bank(1l,"AFFB0123", "Affin Bank");
    }
}
