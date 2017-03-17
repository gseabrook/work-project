package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity(name = "Customer Bank Account")
public class CustomerBankAccount {

    @Column(name = "Bank Name")
    private final Bank bank;
    @Column(name= "Account Number")
    private final String accountNumber;

    public CustomerBankAccount(@JsonProperty("bank") Bank bank,
                               @JsonProperty("accountNumber") String accountNumber) {
        this.bank = bank;
        this.accountNumber = accountNumber;
    }

    public Bank getBank() {
        return bank;
    }

    public String getAccountNumber() {
        return accountNumber;
    }
}
