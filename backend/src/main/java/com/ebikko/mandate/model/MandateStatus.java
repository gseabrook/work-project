package com.ebikko.mandate.model;

public enum MandateStatus implements DisplayEnum {

    PENDING_AUTHORISATION("Pending Authorisation"),
    AUTHORISED("Authorised"),
    TERMINATED("Terminated");

    private final String displayValue;

    MandateStatus(String displayValue) {
        this.displayValue = displayValue;
    }

    @Override
    public String getDisplayValue() {
        return displayValue;
    }
}
