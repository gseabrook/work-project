package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;

@Entity
public class Bank {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    @Column
    private String code;
    @Column
    private String name;

    public Bank() {
    }

    public Bank(Long id, String code, String name) {
        this.id = id;
        this.code = code;
        this.name = name;
    }

    @JsonCreator
    public Bank(@JsonProperty("code") String code,
                @JsonProperty("name") String name) {
        this.code = code;
        this.name = name;
        this.id = null;
    }

    public String getName() {
        return name;
    }

    public String getCode() {
        return code;
    }

    public Long getId() {
        return id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Bank bank = (Bank) o;

        if (code != null ? !code.equals(bank.code) : bank.code != null) return false;
        return name != null ? name.equals(bank.name) : bank.name == null;
    }

    @Override
    public int hashCode() {
        int result = code != null ? code.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
