package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;

@Entity
public class MerchantBankAccount {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE)
    private Long id;
    @ManyToOne
    private Bank bank;
    @Column
    private String accountNumber;
    @Column
    private String sellerId;

    public MerchantBankAccount() {
    }

    @JsonCreator
    public MerchantBankAccount(@JsonProperty("bank") Bank bank,
                               @JsonProperty("accountNumber") String accountNumber,
                               @JsonProperty("sellerId") String sellerId) {
        this.bank = bank;
        this.accountNumber = accountNumber;
        this.sellerId = sellerId;
        this.id = null;
    }

    public MerchantBankAccount(Long id, Bank bank, String accountNumber, String sellerId) {
        this.id = id;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MerchantBankAccount that = (MerchantBankAccount) o;

        if (bank != null ? !bank.equals(that.bank) : that.bank != null) return false;
        if (accountNumber != null ? !accountNumber.equals(that.accountNumber) : that.accountNumber != null)
            return false;
        return sellerId != null ? sellerId.equals(that.sellerId) : that.sellerId == null;
    }

    @Override
    public int hashCode() {
        int result = bank != null ? bank.hashCode() : 0;
        result = 31 * result + (accountNumber != null ? accountNumber.hashCode() : 0);
        result = 31 * result + (sellerId != null ? sellerId.hashCode() : 0);
        return result;
    }
}
