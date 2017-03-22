package com.ebikko.mandate.model;

public enum IDType implements DisplayEnum {

    PASSPORT_NUMBER("Passport Number"),
    NRIC("New IC Number"),
    OLD_IC("Old IC Number"),
    BUSINESS_REGISTRATION_NUMBER("Business Registration Number");

    private final String displayValue;

    IDType(String displayValue) {
        this.displayValue = displayValue;
    }

    public String getDisplayValue() {
        return displayValue;
    }

    public static IDType fromDisplayValue(String value) {
        for (IDType idType : IDType.values()) {
            if (idType.getDisplayValue().equals(value)) {
                return idType;
            }
        }

        throw new RuntimeException("Cant find idType " + value);
    }
}