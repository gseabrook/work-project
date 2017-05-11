package com.ebikko.mandate.web.dto;

import com.ebikko.mandate.web.UniqueReferenceNumber;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

public class MandateDTO {

    private String id;
    @UniqueReferenceNumber
    private String referenceNumber;
    private Date registrationDate;
    @NotNull(message = "Amount cannot be blank")
    @DecimalMin(value = "0.01", message = "Amount must be greater than 0")
    private BigDecimal amount;
    private String frequency;
    private String status;
    private CustomerDTO customer;
    private BankAccountDTO customerBankAccount;

    public MandateDTO() {}

    public String getReferenceNumber() {
        return referenceNumber;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public BankAccountDTO getCustomerBankAccount() {
        return customerBankAccount;
    }

    public void setCustomerBankAccount(BankAccountDTO customerBankAccount) {
        this.customerBankAccount = customerBankAccount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
