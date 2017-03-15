package com.ebikko.mandate.model;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity(name = "Customer Bank Account")
public class CustomerBankAccount {

    @Column(name = "Bank Name")
    private Bank bank;
    @Column(name= "Account Number")
    private String accountNumber;

    public CustomerBankAccount() {}

    public CustomerBankAccount(Bank bank, String accountNumber) {
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
