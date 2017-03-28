package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.CustomerBankAccount;

import static com.ebikko.mandate.builder.BankBuilder.exampleBank;

public class CustomerBankAccountBuilder {

    public static CustomerBankAccount exampleCustomerBankAccount() {
        return new CustomerBankAccount(1l, exampleBank(), "11223344");
    }
}
