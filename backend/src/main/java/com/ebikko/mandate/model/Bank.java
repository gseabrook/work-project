package com.ebikko.mandate.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "Bank Information")
@ReferenceData
public class Bank {

    @Id
    @Column(name = "Bank Code")
    private String code;
    @Column(name = "Bank Name")
    private String name;

    public Bank() {
    }

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
