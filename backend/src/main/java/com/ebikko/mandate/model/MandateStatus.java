package com.ebikko.mandate.model;

/**
 * These are all the possible statuses we can get from FPX. The first 3 are only for MDD
 * and are for when we are waiting for FPX to process a request.
 */
public enum MandateStatus implements DisplayEnum {

    AWAITING_FPX_AUTHORISATION("Awaiting FPX authorisation","-1"),
    AWAITING_FPX_TERMINATION("Awaiting FPX termination","-2"),
    NEW("New","-3"),
    APPROVED("Approved","00"),
    INVALID_MERCHANT("Invalid Merchant","03"),
    INVALID_SELLER_OR_ACQUIRING_BANK_CODE("Invalid Seller Or Acquiring Bank Code","05"),
    TRANSACTION_PENDING("Transaction Pending","09"),
    INVALID_TRANSACTION("Invalid Transaction","12"),
    INVALID_AMOUNT("Invalid Amount","13"),
    INVALID_BUYER_ACCOUNT("Invalid Buyer Account","14"),
    INVALID_RESPONSE("Invalid Response","20"),
    FORMAT_ERROR("Format Error","30"),
    INVALID_BANK("Invalid Bank","31"),
    NO_CREDIT_ACCOUNT("No Credit Account","39"),
    DUPLICATE_SELLER_ORDER_NUMBER("Duplicate Seller Order Number","45"),
    INVALID_SELLER_EXCHANGE_OR_SELLER("Invalid Seller Exchange Or Seller","46"),
    INVALID_CURRENCY("Invalid Currency","47"),
    MAXIMUM_TRANSACTION_LIMIT_EXCEEDED("Maximum Transaction Limit Exceeded","48"),
    MERCHANT_SPECIFIC_LIMIT_EXCEEDED("Merchant Specific Limit Exceeded","49"),
    INVALID_SELLER_FOR_MERCHANT_SPECIFIC_LIMIT("Invalid Seller for Merchant Specific Limit","50"),
    INSUFFICIENT_FUNDS("Insufficient Funds","51"),
    NO_BUYER_ACCOUNT_NUMBER("No Buyer Account Number","53"),
    TRANSACTION_NOT_PERMITTED("Transaction Not Permitted","57"),
    TRANSACTION_TO_MERCHANT_NOT_PERMITTED("Transaction To Merchant Not Permitted","58"),
    INVALID_SERIAL_NUMBER("Invalid Serial Number","70"),
    TRANSACTION_NOT_FOUND("Transaction Not Found","76"),
    INVALID_BUYER_NAME_OR_BUYER_ID("Invalid Buyer Name Or Buyer ID","77"),
    DECRYPTION_FAILED("Decryption Failed","78"),
    HOST_DECLINE_WHEN_DOWN("Host Decline When Down","79"),
    BUYER_CANCEL_TRANSACTION("Buyer Cancel Transaction","80"),
    INVALID_TRANSACTION_MODEL("Invalid Transaction Model","83"),
    INVALID_TRANSACTION_TYPE_84("Invalid Transaction Type","84"),
    INTERNAL_ERROR_AT_BANK_SYSTEM("Internal Error At Bank System","85"),
    DEBIT_FAILED_EXCEPTION_HANDLING("Debit Failed Exception Handling","87"),
    CREDIT_FAILED_EXCEPTION_HANDLING("Credit Failed Exception Handling","88"),
    TRANSACTION_NOT_RECEIVED_EXCEPTION_HANDLING("Transaction Not Received Exception Handling","89"),
    BANK_INTERNET_BANKING_UNAVAILABLE("Bank Internet Banking Unavailable","90"),
    INVALID_BUYER_BANK_96_SYSTEM_MALFUNCTION("Invalid Buyer Bank 96 System Malfunction","92"),
    MAC_ERROR("MAC Error","98"),
    PENDING_AUTHORIZATION_B2B("Pending Authorization (Applicable for B2B model)","99"),
    BLOCKED_BANK("Blocked Bank","BB"),
    TRANSACTION_CANCELLED_BY_CUSTOMER("Transaction Cancelled By Customer","BC"),
    INVALID_APPLICATION_TYPE("Invalid Application Type","DA"),
    INVALID_EMAIL_FORMAT("Invalid Email Format","DB"),
    INVALID_MAXIMUM_FREQUENCY("Invalid Maximum Frequency","DC"),
    INVALID_FREQUENCY_MODE("Invalid Frequency Mode","DD"),
    INVALID_EXPIRY_DATE("Invalid Expiry Date","DE"),
    INVALID_E_MANDATE_BUYER_BANK_ID("Invalid e-Mandate Buyer Bank ID","DF"),
    INTERNAL_ERROR("Internal Error","FE"),
    TRANSACTION_REJECTED_AS_NOT_IN_FPX_OPERATING_HOURS("Transaction Rejected As Not In FPX Operating Hours","OE"),
    TRANSACTION_TIMEOUT("Transaction Timeout","OF"),
    INVALID_ACQUIRING_BANK_CODE("Invalid Acquiring Bank Code","SB"),
    INVALID_SOURCE_IP_ADDRESS_B2B2B("Invalid Source IP Address (Applicable for B2B2 model)","XA"),
    INVALID_SELLER_EXCHANGE_IP("Invalid Seller Exchange IP","XB"),
    SELLER_EXCHANGE_ENCRYPTION_ERROR("Seller Exchange Encryption Error","XC"),
    INVALID_MESSAGE("Invalid Message","XE"),
    INVALID_NUMBER_OF_ORDERS("Invalid Number Of Orders","XF"),
    INVALID_SELLER_EXCHANGE("Invalid Seller Exchange","XI"),
    INVALID_FPX_TRANSACTION_MODEL("Invalid FPX Transaction Model","XM"),
    TRANSACTION_REJECTED_DUE_TO_DUPLICATE_SELLER_EXCHANGE_ORDER_NUMBER("Transaction Rejected Due To Duplicate Seller Exchange Order Number","XN"),
    DUPLICATE_EXCHANGE_ORDER_NUMBER("Duplicate Exchange Order Number","XO"),
    SELLER_DOES_NOT_BELONG_TO_EXCHANGE("Seller Does Not Belong To Exchange","XS"),
    INVALID_TRANSACTION_TYPE_XT("Invalid Transaction Type","XT"),
    SELLER_EXCHANGE_DATE_DIFFERENCE_EXCEEDED("Seller Exchange Date Difference Exceeded","XW"),
    BUYER_SESSION_TIMEOUT_AT_INTERNET_BANKING_LOGIN_PAGE("Buyer Session Timeout At Internet Banking Login Page","1A"),
    BUYER_FAILED_TO_PROVIDE_THE_NECESSARY_INFO_TO_LOGIN_TO_INTERNET("Buyer Failed To Provide The Necessary Info To Login To Internet","1B"),
    BUYER_CHOOSE_CANCEL_AT_LOGIN_PAGE("Buyer Choose Cancel At Login Page","1C"),
    BUYER_SESSION_TIMEOUT_AT_ACCOUNT_SELECTION_PAGE("Buyer Session Timeout At Account Selection Page","1D"),
    BUYER_FAILED_TO_PROVIDE_THE_NECESSARY_INFO_AT_ACCOUNT_SELECTION_PAGE("Buyer Failed To Provide The Necessary Info At Account Selection Page","1E"),
    BUYER_CHOOSE_CANCEL_AT_ACCOUNT_SELECTION_PAGE("Buyer Choose Cancel At Account Selection Page","1F"),
    BUYER_SESSION_TIMEOUT_AT_TAC_REQUEST_PAGE("Buyer Session Timeout At TAC Request Page","1G"),
    BUYER_FAILED_TO_PROVIDE_THE_NECESSARY_INFO_AT_TAC_REQUEST_PAGE("Buyer Failed To Provide The Necessary Info At TAC Request Page","1H"),
    BUYER_CHOOSE_CANCEL_AT_TAC_REQUEST_PAGE("Buyer Choose Cancel At TAC Request Page","1I"),
    BUYER_SESSION_TIMEOUT_AT_CONFIRMATION_PAGE("Buyer Session Timeout At Confirmation Page","1J"),
    BUYER_FAILED_TO_PROVIDE_THE_NECESSARY_INFO_AT_CONFIRMATION_PAGE("Buyer Failed To Provide The Necessary Info At Confirmation Page","1K"),
    BUYER_CHOOSE_CANCEL_AT_CONFIRMATION_PAGE("Buyer Choose Cancel At Confirmation Page","1L"),
    INTERNET_BANKING_SESSION_TIMEOUT("Internet Banking Session Timeout.","1M"),
    TRANSACTION_AMOUNT_IS_LOWER_THAN_MINIMUM_LIMIT("Transaction Amount Is Lower Than Minimum Limit"," 2A");

    private final String displayValue;
    private final String fpxId;

    MandateStatus(String displayValue, String fpxId) {
        this.displayValue = displayValue;
        this.fpxId = fpxId;
    }

    public String getDisplayValue() {
        return displayValue;
    }

    public String getFpxId() {
        return fpxId;
    }

    public static MandateStatus fromFpxCode(String fpx_debitAuthCode) {
        for (MandateStatus status : values()) {
            if (status.getFpxId().equals(fpx_debitAuthCode)) {
                return status;
            }
        }

        return null;
    }
}
