package com.ebikko.mandate.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.util.List;

@Entity(name = "Customer Information")
public class Customer {

    @Column(name = "Customer Name")
    private String name;
    @Column(name = "Email")
    private String emailAddress;
    @Column(name = "Phone Number")
    private String phoneNumber;
    @Column(name = "ID Number")
    private String idValue;
    @Column(name = "ID Type")
    private IDType idType;
    @Column(name = "Customer Bank Account")
    private List<CustomerBankAccount> bankAccounts;

    public Customer() {}

    public String getName() {
        return name;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public List<CustomerBankAccount> getBankAccounts() {
        return bankAccounts;
    }

    public String getIdValue() {
        return idValue;
    }

    public IDType getIdType() {
        return idType;
    }
}
