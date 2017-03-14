package com.ebikko.mandate.model;

import javax.persistence.Column;

public class MerchantBankAccount {

    @Column(name = "bank")
    private final Bank bank;
    @Column(name= "account_number")
    private final String accountNumber;
    private final String sellerId;

    public MerchantBankAccount(Bank bank, String accountNumber, String sellerId) {
        this.bank = bank;
        this.accountNumber = accountNumber;
        this.sellerId = sellerId;
    }

    public Bank getBank() {
        return bank;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public String getSellerId() {
        return sellerId;
    }
}
