package com.ebikko.mandate.model;

public class CustomerID {

    private String value;
    private IDType type;

    public CustomerID() {}

    public CustomerID(String value, IDType type) {
        this.value = value;
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public IDType getType() {
        return type;
    }
}
