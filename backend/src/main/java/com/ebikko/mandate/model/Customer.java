package com.ebikko.mandate.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Customer {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    public Long id;
    @Column
    public String name;
    @Column
    public String emailAddress;
    @Column
    public String phoneNumber;
    @Column
    public String idValue;
    @Column
    public IDType idType;
    @OneToMany(cascade = CascadeType.ALL)
    public List<CustomerBankAccount> bankAccounts;

    public Customer() {
    }

    public Customer(Long id, String name, String emailAddress, String phoneNumber, String idValue, IDType idType, List<CustomerBankAccount> bankAccounts) {
        this.id = id;
        this.name = name;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.idValue = idValue;
        this.idType = idType;
        this.bankAccounts = bankAccounts;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getIdValue() {
        return idValue;
    }

    public void setIdValue(String idValue) {
        this.idValue = idValue;
    }

    public IDType getIdType() {
        return idType;
    }

    public void setIdType(IDType idType) {
        this.idType = idType;
    }

    public List<CustomerBankAccount> getBankAccounts() {
        return bankAccounts;
    }

    public void setBankAccounts(List<CustomerBankAccount> bankAccounts) {
        this.bankAccounts = bankAccounts;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Customer customer = (Customer) o;

        if (name != null ? !name.equals(customer.name) : customer.name != null) return false;
        if (emailAddress != null ? !emailAddress.equals(customer.emailAddress) : customer.emailAddress != null)
            return false;
        if (phoneNumber != null ? !phoneNumber.equals(customer.phoneNumber) : customer.phoneNumber != null)
            return false;
        if (idValue != null ? !idValue.equals(customer.idValue) : customer.idValue != null) return false;
        if (idType != customer.idType) return false;
        return bankAccounts != null ? bankAccounts.equals(customer.bankAccounts) : customer.bankAccounts == null;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (emailAddress != null ? emailAddress.hashCode() : 0);
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);
        result = 31 * result + (idValue != null ? idValue.hashCode() : 0);
        result = 31 * result + (idType != null ? idType.hashCode() : 0);
        result = 31 * result + (bankAccounts != null ? bankAccounts.hashCode() : 0);
        return result;
    }
}
