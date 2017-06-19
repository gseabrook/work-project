package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

@Entity
public class Customer extends MandateParty {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE)
    private Long id;
    @Column
    private String name;
    @Column
    private String idValue;
    @Column
    private IDType idType;
    @Column
    private String principalUid;
    @OneToMany(cascade = CascadeType.ALL)
    private List<CustomerBankAccount> bankAccounts = newArrayList();
    @JsonIgnore
    @OneToMany(mappedBy = "buyer")
    private List<Mandate> mandates = newArrayList();

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

    @Override
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
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

    public String getPrincipalUid() {
        return principalUid;
    }

    public void setPrincipalUid(String principalUid) {
        this.principalUid = principalUid;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Mandate> getMandates() {
        return mandates;
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

    public void addBankAccount(CustomerBankAccount customerBankAccount) {
        if (!bankAccounts.contains(customerBankAccount)) {
            bankAccounts.add(customerBankAccount);
        }
    }

    public void addMandate(Mandate mandate) {
        if (!mandates.contains(mandate)) {
            mandates.add(mandate);
        }
    }
}
