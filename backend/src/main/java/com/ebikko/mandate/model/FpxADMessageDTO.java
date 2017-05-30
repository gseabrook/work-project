package com.ebikko.mandate.model;

import java.text.SimpleDateFormat;

import static org.apache.commons.lang3.StringUtils.defaultIfBlank;

//Fields with a question mark need more info
/**
 * The message we post to FPX to start the e mandate authorisation process and pass the
 * browser over to the FPX flow. Listed is more information to clarify some of the fields
 *
 * <table>
 *  <tr>
 *      <th>Field</th>
 *      <th>Info</th>
 *  </tr>
 *  <tr>
 *      <td>fpx_sellerExId</td>
 *      <td>Exchange ID for Ag-I</td>
 *  </tr>
 *  <tr>
 *      <td>fpx_sellerExOrderNo</td>
 *      <td>Unique ID we generate for each mandate</td>
 *  </tr>
 *  <tr>
 *      <td>fpx_sellerId</td>
 *      <td>Seller ID for the Merchant, eg Jim's Gym</td>
 *  </tr>
 *  <tr>
 *      <td>fpx_buyerId</td>
 *      <td>Comma separated ID Type and ID Value of the customer</td>
 *  </tr>
 * </table>
 *
 */
public class FpxADMessageDTO {

    private static final String TIMESTAMP_DATEFORMAT = "yyyyMMddHHmmSS";
    private static final String DATE_DATEFORMAT = "ddMMyy";

    private String fpx_msgType;
    private String fpx_msgToken;
    private String fpx_sellerExId; // ?
    private String fpx_sellerExOrderNo;
    private String fpx_sellerTxnTime;
    private String fpx_sellerOrderNo; // ?
    private String fpx_sellerId; // ?
    private String fpx_sellerBankCode; // ?
    private String fpx_txnCurrency;
    private String fpx_txnAmount;
    private String fpx_buyerEmail;
    private String fpx_checkSum;
    private String fpx_buyerBankId;
    private String fpx_buyerId;
    private String fpx_buyerIBan; // ?
    private String fpx_productDesc;
    private String fpx_version;

    public FpxADMessageDTO(Mandate mandate) {
        this.fpx_msgType = "AD";
        this.fpx_msgToken = "01";
        this.fpx_sellerExOrderNo = String.valueOf(mandate.getId());
        this.fpx_sellerTxnTime = new SimpleDateFormat(TIMESTAMP_DATEFORMAT).format(mandate.getRegistrationDate());
        this.fpx_txnCurrency = "MYR";
        this.fpx_txnAmount = mandate.getAmount().toString();

        Customer customer = mandate.getCustomer();
        this.fpx_buyerEmail = customer.getEmailAddress();
        if (mandate.getCustomerBankAccount() != null) {
            this.fpx_buyerBankId = mandate.getCustomerBankAccount().getBank().getCode();
        }
        this.fpx_buyerId = customer.getIdValue() + "," + customer.getIdType().getFpxId();

        // Max Freq
        // Expiry Date
        String iBan = getMsgType(mandate) + "," + defaultIfBlank(customer.getPhoneNumber(), "") + "," + mandate.getFrequency().getFpxId();
        iBan += "," + new SimpleDateFormat(DATE_DATEFORMAT).format(mandate.getRegistrationDate()) + ",";
        this.fpx_buyerIBan = iBan;
        this.fpx_version = "7.0";
    }

    private String getMsgType(Mandate mandate) {
        if (mandate.getStatus().isAwaitingFPXProcessing()) {
            return "01"; // New Application
        }
        if (mandate.getStatus().isCancelled()) {
            return "03"; // Maintenance
        }

        return "02"; // Termination
    }

    private String getCheckSumSource() {
        StringBuilder builder = new StringBuilder("|");
        builder.append("||"); // Unused - fpx_buyerAccNo, fpx_buyerBankBranch
        builder.append(this.fpx_buyerBankId).append("|");
        builder.append(this.fpx_buyerEmail).append("|");
        builder.append(this.fpx_buyerIBan).append("|");
        builder.append("||"); // Unused - fpx_buyerName, fpx_makerName
        builder.append(this.fpx_msgToken).append("|");
        builder.append(this.fpx_msgType).append("|");
        builder.append(this.fpx_productDesc).append("|");
        builder.append(this.fpx_sellerBankCode).append("|");
        builder.append(this.fpx_sellerExId).append("|");
        builder.append(this.fpx_sellerExOrderNo).append("|");
        builder.append(this.fpx_sellerId).append("|");
        builder.append(this.fpx_sellerOrderNo).append("|");
        builder.append(this.fpx_sellerTxnTime).append("|");
        builder.append(this.fpx_txnAmount).append("|");
        builder.append(this.fpx_txnCurrency).append("|");
        builder.append(this.fpx_version);
        return builder.toString();
    }

    public String getFpx_msgType() {
        return fpx_msgType;
    }

    public void setFpx_msgType(String fpx_msgType) {
        this.fpx_msgType = fpx_msgType;
    }

    public String getFpx_msgToken() {
        return fpx_msgToken;
    }

    public void setFpx_msgToken(String fpx_msgToken) {
        this.fpx_msgToken = fpx_msgToken;
    }

    public String getFpx_sellerExId() {
        return fpx_sellerExId;
    }

    public void setFpx_sellerExId(String fpx_sellerExId) {
        this.fpx_sellerExId = fpx_sellerExId;
    }

    public String getFpx_sellerExOrderNo() {
        return fpx_sellerExOrderNo;
    }

    public void setFpx_sellerExOrderNo(String fpx_sellerExOrderNo) {
        this.fpx_sellerExOrderNo = fpx_sellerExOrderNo;
    }

    public String getFpx_sellerTxnTime() {
        return fpx_sellerTxnTime;
    }

    public void setFpx_sellerTxnTime(String fpx_sellerTxnTime) {
        this.fpx_sellerTxnTime = fpx_sellerTxnTime;
    }

    public String getFpx_sellerOrderNo() {
        return fpx_sellerOrderNo;
    }

    public void setFpx_sellerOrderNo(String fpx_sellerOrderNo) {
        this.fpx_sellerOrderNo = fpx_sellerOrderNo;
    }

    public String getFpx_sellerId() {
        return fpx_sellerId;
    }

    public void setFpx_sellerId(String fpx_sellerId) {
        this.fpx_sellerId = fpx_sellerId;
    }

    public String getFpx_sellerBankCode() {
        return fpx_sellerBankCode;
    }

    public void setFpx_sellerBankCode(String fpx_sellerBankCode) {
        this.fpx_sellerBankCode = fpx_sellerBankCode;
    }

    public String getFpx_txnCurrency() {
        return fpx_txnCurrency;
    }

    public void setFpx_txnCurrency(String fpx_txnCurrency) {
        this.fpx_txnCurrency = fpx_txnCurrency;
    }

    public String getFpx_txnAmount() {
        return fpx_txnAmount;
    }

    public void setFpx_txnAmount(String fpx_txnAmount) {
        this.fpx_txnAmount = fpx_txnAmount;
    }

    public String getFpx_buyerEmail() {
        return fpx_buyerEmail;
    }

    public void setFpx_buyerEmail(String fpx_buyerEmail) {
        this.fpx_buyerEmail = fpx_buyerEmail;
    }

    public String getFpx_checkSum() {
        return fpx_checkSum;
    }

    public void setFpx_checkSum(String fpx_checkSum) {
        this.fpx_checkSum = fpx_checkSum;
    }

    public String getFpx_buyerBankId() {
        return fpx_buyerBankId;
    }

    public void setFpx_buyerBankId(String fpx_buyerBankId) {
        this.fpx_buyerBankId = fpx_buyerBankId;
    }

    public String getFpx_buyerId() {
        return fpx_buyerId;
    }

    public void setFpx_buyerId(String fpx_buyerId) {
        this.fpx_buyerId = fpx_buyerId;
    }

    public String getFpx_buyerIBan() {
        return fpx_buyerIBan;
    }

    public void setFpx_buyerIBan(String fpx_buyerIBan) {
        this.fpx_buyerIBan = fpx_buyerIBan;
    }

    public String getFpx_productDesc() {
        return fpx_productDesc;
    }

    public void setFpx_productDesc(String fpx_productDesc) {
        this.fpx_productDesc = fpx_productDesc;
    }

    public String getFpx_version() {
        return fpx_version;
    }

    public void setFpx_version(String fpx_version) {
        this.fpx_version = fpx_version;
    }
}
