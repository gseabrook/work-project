package com.ebikko.mandate.model;

public class CustomerID {

    private String id;
    private IDType idType;

    public CustomerID() {}

    public CustomerID(String id, IDType idType) {
        this.id = id;
        this.idType = idType;
    }

    public String getId() {
        return id;
    }

    public IDType getIdType() {
        return idType;
    }
}
