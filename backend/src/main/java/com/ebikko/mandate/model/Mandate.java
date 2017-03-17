package com.ebikko.mandate.model;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

public class Mandate {

    public static final String MANDATE_NODE_TYPE = "eMandate Form";

    private String referenceNumber;
    private Date registrationDate;
    @NotNull(message = "Amount cannot be blank")
    @DecimalMin(value = "0.01", message = "Amount must be greater than 0")
    private BigDecimal amount;
    private MandateFrequency frequency;
    private Customer customer;

    public Mandate() {}

    public Mandate(String referenceNumber, Date registrationDate, BigDecimal amount, MandateFrequency frequency, Customer customer) {
        this.referenceNumber = referenceNumber;
        this.registrationDate = registrationDate;
        this.amount = amount;
        this.frequency = frequency;
        this.customer = customer;
    }

    public String getReferenceNumber() {
        return referenceNumber;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public MandateFrequency getFrequency() {
        return frequency;
    }

    public Customer getCustomer() {
        return customer;
    }

}
