package com.ebikko.mandate.model;

import com.ebikko.mandate.web.MerchantDeserializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

import static com.ebikko.mandate.model.Mandate.MANDATE_NODE_TYPE;

@Entity(name = MANDATE_NODE_TYPE)
public class Mandate {

    public static final String MANDATE_NODE_TYPE = "eMandate Form";

    @Column(name = "Reference Number")
    public String referenceNumber;
    @Column(name = "Registration Date")
    public Date registrationDate;
    @Column(name = "Maximum Amount")
    @NotNull(message = "Amount cannot be blank")
    @DecimalMin(value = "0.01", message = "Amount must be greater than 0")
    public BigDecimal amount;
    @Column(name = "Frequency")
    public MandateFrequency frequency;
    public Customer customer;
    @JsonDeserialize(using = MerchantDeserializer.class)
    @Column(name = "Merchant")
    public Merchant merchant;

    public Mandate() {
    }

    public Mandate(String referenceNumber, Date registrationDate, BigDecimal amount, MandateFrequency frequency, Customer customer, Merchant merchant) {
        this.referenceNumber = referenceNumber;
        this.registrationDate = registrationDate;
        this.amount = amount;
        this.frequency = frequency;
        this.customer = customer;
        this.merchant = merchant;
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

    public Merchant getMerchant() {
        return merchant;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Mandate mandate = (Mandate) o;

        if (referenceNumber != null ? !referenceNumber.equals(mandate.referenceNumber) : mandate.referenceNumber != null)
            return false;
        if (registrationDate != null ? !registrationDate.equals(mandate.registrationDate) : mandate.registrationDate != null)
            return false;
        if (amount != null ? !amount.equals(mandate.amount) : mandate.amount != null) return false;
        if (frequency != mandate.frequency) return false;
        if (customer != null ? !customer.equals(mandate.customer) : mandate.customer != null) return false;
        return merchant != null ? merchant.equals(mandate.merchant) : mandate.merchant == null;
    }

    @Override
    public int hashCode() {
        int result = referenceNumber != null ? referenceNumber.hashCode() : 0;
        result = 31 * result + (registrationDate != null ? registrationDate.hashCode() : 0);
        result = 31 * result + (amount != null ? amount.hashCode() : 0);
        result = 31 * result + (frequency != null ? frequency.hashCode() : 0);
        result = 31 * result + (customer != null ? customer.hashCode() : 0);
        result = 31 * result + (merchant != null ? merchant.hashCode() : 0);
        return result;
    }
}
