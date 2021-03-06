package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;

@Entity
public class CustomerBankAccount {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE)
    private Long id;
    @ManyToOne
    private Customer customer;
    @ManyToOne
    private Bank bank;
    @Column
    private String accountNumber;

    public CustomerBankAccount() {
    }

    @JsonCreator
    public CustomerBankAccount(@JsonProperty("bank") Bank bank,
                               @JsonProperty("accountNumber") String accountNumber) {
        this.id = null;
        this.bank = bank;
        this.accountNumber = accountNumber;
    }

    public CustomerBankAccount(Long id, Bank bank, String accountNumber) {
        this.id = id;
        this.bank = bank;
        this.accountNumber = accountNumber;
    }

    public Bank getBank() {
        return bank;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CustomerBankAccount that = (CustomerBankAccount) o;

        if (bank != null ? !bank.equals(that.bank) : that.bank != null) return false;
        return accountNumber != null ? accountNumber.equals(that.accountNumber) : that.accountNumber == null;
    }

    @Override
    public int hashCode() {
        int result = bank != null ? bank.hashCode() : 0;
        result = 31 * result + (accountNumber != null ? accountNumber.hashCode() : 0);
        return result;
    }
}
