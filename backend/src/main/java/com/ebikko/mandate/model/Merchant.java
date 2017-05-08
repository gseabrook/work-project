package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

@Entity
public class Merchant {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE)
    private Long id;
    @Column
    private String companyRegistrationNumber;
    @Column
    private String companyName;
    @OneToMany
    private List<MerchantBankAccount> merchantBankAccounts;
    @JsonIgnore
    @OneToMany(mappedBy = "merchant")
    private List<Mandate> mandates = newArrayList();

    public Merchant() {}

    @JsonCreator
    public Merchant(@JsonProperty("companyName") String companyName,
                    @JsonProperty("companyRegistrationNumber") String companyRegistrationNumber,
                    @JsonProperty("merchantBankAccount") MerchantBankAccount merchantBankAccount) {
        this.companyName = companyName;
        this.companyRegistrationNumber = companyRegistrationNumber;
        this.merchantBankAccounts = newArrayList(merchantBankAccount);
    }

    public Merchant(Long id) {
        this.id = id;
    }

    public Merchant(Long id, String companyName, String companyRegistrationNumber, ArrayList<MerchantBankAccount> merchantBankAccounts) {
        this.id = id;
        this.companyName = companyName;
        this.companyRegistrationNumber = companyRegistrationNumber;
        this.merchantBankAccounts = merchantBankAccounts;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getCompanyRegistrationNumber() {
        return companyRegistrationNumber;
    }


    public void setCompanyRegistrationNumber(String companyRegistrationNumber) {
        this.companyRegistrationNumber = companyRegistrationNumber;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public List<MerchantBankAccount> getMerchantBankAccounts() {
        return merchantBankAccounts;
    }

    public void setMerchantBankAccounts(List<MerchantBankAccount> merchantBankAccounts) {
        this.merchantBankAccounts = merchantBankAccounts;
    }

    public Long getId() {
        return id;
    }

    public List<Mandate> getMandates() {
        return mandates;
    }

    public void setMandates(List<Mandate> mandates) {
        this.mandates = mandates;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Merchant merchant = (Merchant) o;

        if (companyRegistrationNumber != null ? !companyRegistrationNumber.equals(merchant.companyRegistrationNumber) : merchant.companyRegistrationNumber != null)
            return false;
        if (companyName != null ? !companyName.equals(merchant.companyName) : merchant.companyName != null)
            return false;
        return merchantBankAccounts != null ? merchantBankAccounts.equals(merchant.merchantBankAccounts) : merchant.merchantBankAccounts == null;
    }

    @Override
    public int hashCode() {
        int result = companyRegistrationNumber != null ? companyRegistrationNumber.hashCode() : 0;
        result = 31 * result + (companyName != null ? companyName.hashCode() : 0);
        result = 31 * result + (merchantBankAccounts != null ? merchantBankAccounts.hashCode() : 0);
        return result;
    }

    public void addMandate(Mandate mandate) {
        mandates.add(mandate);
    }
}
