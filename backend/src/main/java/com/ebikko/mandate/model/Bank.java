package com.ebikko.mandate.model;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity(name = "Bank Information")
public class Bank {

    @Column(name = "Bank Code")
    private final String code;
    @Column(name = "Bank Name")
    private final String name;

    public Bank(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getCode() {
        return code;
    }
}
