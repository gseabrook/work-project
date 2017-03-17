package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "Bank Information")
@ReferenceData
public class Bank {

    @Id
    @Column(name = "Bank Code")
    private final String code;
    @Column(name = "Bank Name")
    private final String name;

    @JsonCreator
    public Bank(@JsonProperty("code") String code,
                @JsonProperty("name") String name) {
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
