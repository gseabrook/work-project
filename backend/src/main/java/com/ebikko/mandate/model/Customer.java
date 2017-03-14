package com.ebikko.mandate.model;

public class Customer {

    private String name;
    private String emailAddress;
    private String phoneNumber;
    private CustomerID id;
    private BankAccount bankAccount;

    public Customer() {}

    public Customer(String name, String emailAddress, String phoneNumber, CustomerID id, BankAccount bankAccount) {
        this.name = name;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.id = id;
        this.bankAccount = bankAccount;
    }

    public String getName() {
        return name;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public CustomerID getId() {
        return id;
    }

    public BankAccount getBankAccount() {
        return bankAccount;
    }
}
