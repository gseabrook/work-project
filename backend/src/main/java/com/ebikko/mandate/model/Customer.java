package com.ebikko.mandate.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.List;

@Entity(name = "Customer Information")
public class Customer {

    @Id
    public String id;
    @Column(name = "Customer Name")
    public String name;
    @Column(name = "Email")
    public String emailAddress;
    @Column(name = "Phone Number")
    public String phoneNumber;
    @Column(name = "ID Number")
    public String idValue;
    @Column(name = "ID Type")
    public IDType idType;
    @Column(name = "Customer Bank Account")
    public List<CustomerBankAccount> bankAccounts;

    public Customer() {
    }

    public Customer(String id, String name, String emailAddress, String phoneNumber, String idValue, IDType idType, List<CustomerBankAccount> bankAccounts) {
        this.id = id;
        this.name = name;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.idValue = idValue;
        this.idType = idType;
        this.bankAccounts = bankAccounts;
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

    public List<CustomerBankAccount> getBankAccounts() {
        return bankAccounts;
    }

    public String getIdValue() {
        return idValue;
    }

    public IDType getIdType() {
        return idType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
