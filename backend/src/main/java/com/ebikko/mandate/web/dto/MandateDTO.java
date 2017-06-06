package com.ebikko.mandate.web.dto;

import com.ebikko.mandate.web.UniqueReferenceNumber;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.Date;

public class MandateDTO {

    private String id;
    @UniqueReferenceNumber
    private String referenceNumber;
    private Date registrationDate;
    @ValidBigDecimal(min = "0.01", field = "Amount")
    private String amount;
    private String frequency;
    @NotNull(message = "Status cannot be blank")
    private String status;
    @Valid
    private CustomerDTO customer;
    private BankAccountDTO customerBankAccount;
    private String nodeId;
    private String purposeOfPayment;
    @ValidBigDecimal(min = "0", field = "Maximum frequency")
    private String maximumFrequency;

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

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
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

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
    }

    public String getPurposeOfPayment() {
        return purposeOfPayment;
    }

    public void setPurposeOfPayment(String purposeOfPayment) {
        this.purposeOfPayment = purposeOfPayment;
    }

    public String getMaximumFrequency() {
        return maximumFrequency;
    }

    public void setMaximumFrequency(String maximumFrequency) {
        this.maximumFrequency = maximumFrequency;
    }
}
