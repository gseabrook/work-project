package com.ebikko.mandate.model;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

@Entity
public class Mandate {

    public static final String MANDATE_NODE_TYPE = "eMandate Form";

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;
    @Column
    private String referenceNumber;
    @Column
    private Date registrationDate;
    @Column
    @NotNull(message = "Amount cannot be blank")
    @DecimalMin(value = "0.01", message = "Amount must be greater than 0")
    private BigDecimal amount;
    @Column
    private MandateFrequency frequency;
    @Column
    private MandateStatus status;
    @ManyToOne(cascade = CascadeType.ALL)
    private Customer customer;
    @ManyToOne
    private Merchant merchant;
    @ManyToOne(cascade = CascadeType.ALL)
    private CustomerBankAccount customerBankAccount;
    @Column
    private String nodeId;

    public Mandate() {
    }

    public Long getId() {
        return id;
    }

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

    public MandateFrequency getFrequency() {
        return frequency;
    }

    public void setFrequency(MandateFrequency frequency) {
        this.frequency = frequency;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Merchant getMerchant() {
        return merchant;
    }

    public void setMerchant(Merchant merchant) {
        this.merchant = merchant;
    }

    public CustomerBankAccount getCustomerBankAccount() {
        return customerBankAccount;
    }

    public void setCustomerBankAccount(CustomerBankAccount customerBankAccount) {
        this.customerBankAccount = customerBankAccount;
    }

    public MandateStatus getStatus() {
        return status;
    }

    public void setStatus(MandateStatus status) {
        this.status = status;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
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
