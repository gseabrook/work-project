package com.ebikko.mandate.model;

public enum IDType implements DisplayEnum {

    PASSPORT_NUMBER("Passport Number"),
    NRIC("NRIC"),
    OLD_IC("Old IC"),
    BUSINESS_REGISTRATION_NUMBER("Business Registration");

    private final String displayValue;

    IDType(String displayValue) {
        this.displayValue = displayValue;
    }

    public String getDisplayValue() {
        return displayValue;
    }
}