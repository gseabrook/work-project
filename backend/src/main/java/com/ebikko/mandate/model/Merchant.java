package com.ebikko.mandate.model;

public class Merchant {

    private final String companyName;
    private final String companyRegistrationNumber;
    private final MerchantBankAccount merchantBankAccount;

    public Merchant(String companyName, String companyRegistrationNumber, MerchantBankAccount merchantBankAccount) {
        this.companyName = companyName;
        this.companyRegistrationNumber = companyRegistrationNumber;
        this.merchantBankAccount = merchantBankAccount;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getCompanyRegistrationNumber() {
        return companyRegistrationNumber;
    }

    public MerchantBankAccount getMerchantBankAccount() {
        return merchantBankAccount;
    }
}
