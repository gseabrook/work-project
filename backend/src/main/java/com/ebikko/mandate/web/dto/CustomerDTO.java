package com.ebikko.mandate.web.dto;

import org.hibernate.validator.constraints.NotBlank;

public class CustomerDTO {

    @NotBlank(message = "Please enter a name")
    private String name;
    @NotBlank(message = "Please enter an email address")
    private String emailAddress;
    @NotBlank(message = "Please enter an ID Type")
    private String idType;
    @NotBlank(message = "Please enter an ID Value")
    private String idValue;
    private String phoneNumber;

    public CustomerDTO() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getIdType() {
        return idType;
    }

    public void setIdType(String idType) {
        this.idType = idType;
    }

    public String getIdValue() {
        return idValue;
    }

    public void setIdValue(String idValue) {
        this.idValue = idValue;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
