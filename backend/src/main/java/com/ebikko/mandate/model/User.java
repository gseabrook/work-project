package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.security.Principal;

public class User implements Principal {

    public String getEmailAddress() {
        return emailAddress;
    }

    public enum UserType {
        MERCHANT, CUSTOMER
    }

    private final String principalId;
    private final String id;
    private final String username;
    private final String name;
    private final UserType type;
    private final String emailAddress;

    public User(String principalId, String id, String username, String name, UserType type, String emailAddress) {
        this.principalId = principalId;
        this.id = id;
        this.username = username;
        this.name = name;
        this.type = type;
        this.emailAddress = emailAddress;
    }

    public String getPrincipalId() {
        return principalId;
    }

    public String getUsername() {
        return username;
    }

    public String getName() {
        return name;
    }

    public UserType getType() {
        return type;
    }

    public String getId() {
        return id;
    }

    @JsonIgnore
    public boolean isCustomer() {
        return type == UserType.CUSTOMER;
    }

    @JsonIgnore
    public boolean isMerchant() {
        return type == UserType.MERCHANT;
    }
}
