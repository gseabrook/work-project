package com.ebikko.mandate.model;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * The mandate is the agreement that the merchant is able to take money from the buyer's bank account.
 * <br/><br/>
 * The status is driven by the FPX system, as any change to the agreement (including the initial authorisation) happens
 * via the buyer logging into their online banking. This will trigger an AC message sent to our system, which we will
 * use to update the status of the mandate.
 * <br/><br/>
 * FPX currently assumes that the same amount will be taken at regular intervals (hence the amount & frequency fields),
 * however in the future we would like to simplify this and remove the amount, frequency and max frequence fields.
 * <br/><br/>
 * <b>Fields</b>
 * <table>
 *     <tr>
 *         <td>Reference Number</td>
 *         <td>Merchant's reference number for their information, in future we would like automatically populate this from the merchant's system</td>
 *     </tr>
 *     <tr>
 *         <td>Customer Bank Account</td>
 *         <td>We need a direct reference to the buyer bank account so that if the buyer has multiple bank accounts, we know
 *         which one was authorised</td>
 *     </tr>
 *     <tr>
 *         <td>Node ID</td>
 *         <td>This is the ID of the node we are storing in Ebikko for audit purposes</td>
 *     </tr>
 *     <tr>
 *         <td>FPX Transaction ID</td>
 *         <td>The FPX spec requires us to display the fpx transaction ID upon completion of a mandate, so we store it here</td>
 *     </tr>
 * </table>
 *
 * @see com.ebikko.acmessage.FpxACMessageDTO FpxACMessageDTO
 */
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
    private BigDecimal amount;
    @Column
    private MandateFrequency frequency;
    @Column
    private Integer maximumFrequency;
    @Column
    private MandateStatus status;
    @ManyToOne(cascade = CascadeType.ALL)
    private MandateParty buyer;
    @ManyToOne
    private Merchant merchant;
    @ManyToOne(cascade = CascadeType.ALL)
    private CustomerBankAccount customerBankAccount;
    @Column
    private String nodeId;
    @Column
    private String fpxTransactionId;
    @Column
    private String purposeOfPayment;

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    private Date dateCreated;

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

    public MandateParty getBuyer() {
        return buyer;
    }

    public void setBuyer(MandateParty buyer) {
        this.buyer = buyer;
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

    public String getFpxTransactionId() {
        return fpxTransactionId;
    }

    public void setFpxTransactionId(String fpxTransactionId) {
        this.fpxTransactionId = fpxTransactionId;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Integer getMaximumFrequency() {
        return maximumFrequency;
    }

    public void setMaximumFrequency(Integer maximumFrequency) {
        this.maximumFrequency = maximumFrequency;
    }

    public String getPurposeOfPayment() {
        return purposeOfPayment;
    }

    public void setPurposeOfPayment(String purposeOfPayment) {
        this.purposeOfPayment = purposeOfPayment;
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
        if (buyer != null ? !buyer.equals(mandate.buyer) : mandate.buyer != null) return false;
        return merchant != null ? merchant.equals(mandate.merchant) : mandate.merchant == null;
    }

    @Override
    public int hashCode() {
        int result = referenceNumber != null ? referenceNumber.hashCode() : 0;
        result = 31 * result + (registrationDate != null ? registrationDate.hashCode() : 0);
        result = 31 * result + (amount != null ? amount.hashCode() : 0);
        result = 31 * result + (frequency != null ? frequency.hashCode() : 0);
        result = 31 * result + (buyer != null ? buyer.hashCode() : 0);
        result = 31 * result + (merchant != null ? merchant.hashCode() : 0);
        return result;
    }
}
