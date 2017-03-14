package com.ebikko.mandate.model;

import java.math.BigDecimal;
import java.util.Date;

public class Mandate {

    private String referenceNumber;
    private Date registrationDate;
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
