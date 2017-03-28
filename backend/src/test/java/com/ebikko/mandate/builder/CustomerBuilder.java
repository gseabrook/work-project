package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.CustomerBankAccount;
import com.ebikko.mandate.model.IDType;

import static com.ebikko.mandate.builder.CustomerBankAccountBuilder.exampleCustomerBankAccount;
import static com.google.common.collect.Lists.newArrayList;

public class CustomerBuilder {

    public static Customer exampleCustomer(CustomerBankAccount customerBankAccount) {
        return new Customer(123l,"Joe", "test@example.com", "0111234456", "54321234", IDType.PASSPORT_NUMBER, newArrayList(customerBankAccount));
    }

    public static Customer exampleCustomer() {
        return exampleCustomer(exampleCustomerBankAccount());
    }
}
