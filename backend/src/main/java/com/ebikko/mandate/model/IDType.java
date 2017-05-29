package com.ebikko.mandate.model;

public enum IDType implements DisplayEnum {

    PASSPORT_NUMBER("Passport Number", "3"),
    NRIC("New IC Number", "1"),
    OLD_IC("Old IC Number", "2"),
    BUSINESS_REGISTRATION_NUMBER("Business Registration Number", "4"),
    OTHERS("Others", "5");

    private final String displayValue;
    private final String fpxId;

    IDType(String displayValue, String fpxId) {
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