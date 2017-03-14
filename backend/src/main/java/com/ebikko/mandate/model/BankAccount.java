package com.ebikko.mandate.model;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity(name = "Customer Bank Account")
public class BankAccount {

    @Column(name = "bank")
    private Bank bank;
    @Column(name= "account_number")
    private String accountNumber;

    public BankAccount() {}

    public BankAccount(Bank bank, String accountNumber) {
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
