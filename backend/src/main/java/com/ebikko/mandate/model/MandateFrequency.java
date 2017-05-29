package com.ebikko.mandate.model;

public enum MandateFrequency implements DisplayEnum {

    DAILY("Daily", "DL"),
    WEEKLY("Weekly", "WK"),
    MONTHLY("Monthly", "MT"),
    QUARTERLY("Quarterly", "QR"),
    YEARLY("Yearly", "YR");

    private final String displayValue;
    private final String fpxId;

    MandateFrequency(String displayValue, String fpxId) {
        this.displayValue = displayValue;
        this.fpxId = fpxId;
    }

    public String getDisplayValue() {
        return displayValue;
    }

    public String getFpxId() {
        return fpxId;
    }
}
