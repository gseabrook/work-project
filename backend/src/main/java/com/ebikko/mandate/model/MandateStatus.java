package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
public class MandateStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;
    @Column
    private String code;
    @Column
    private String description;

    public MandateStatus() {}

    @JsonIgnore
    public boolean isAwaitingFPXProcessing() {
        return "-1".equals(code);
    }

    @JsonIgnore
    public boolean isAuthorised() {
        return "00".equals(code);
    }

    @JsonIgnore
    public boolean isPending() {
        return "09".equals(code);
    }

    @JsonIgnore
    public boolean isCancelled() {
        return "BC".equals(code);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
