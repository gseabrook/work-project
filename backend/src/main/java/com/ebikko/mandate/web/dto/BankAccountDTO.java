package com.ebikko.mandate.web.dto;

public class BankAccountDTO {

    private Long bankId;
    private String accountNumber;

    public BankAccountDTO() {
    }

    public Long getBankId() {
        return bankId;
    }

    public void setBankId(Long bankId) {
        this.bankId = bankId;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
}
