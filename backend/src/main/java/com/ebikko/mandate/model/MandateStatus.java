package com.ebikko.mandate.model;

public enum MandateStatus implements DisplayEnum {

    PENDING_AUTHORISATION("Pending Authorisation", "01"),
    AUTHORISED("Authorised", "02"),
    TERMINATED("Terminated", "03");

    private final String displayValue;
    private final String fpxId;

    MandateStatus(String displayValue, String fpxId) {
        this.displayValue = displayValue;
        this.fpxId = fpxId;
    }

    @Override
    public String getDisplayValue() {
        return displayValue;
    }

    public String getFpxId() {
        return fpxId;
    }
}
