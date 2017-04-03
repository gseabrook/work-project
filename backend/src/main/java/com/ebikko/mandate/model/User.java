package com.ebikko.mandate.model;

import java.security.Principal;

public class User implements Principal {

    public enum UserType {
        MERCHANT, CUSTOMER
    }

    private final String principalId;
    private final String id;
    private final String username;
    private final String name;
    private final UserType userType;

    public User(String principalId, String id, String username, String name, UserType userType) {
        this.principalId = principalId;
        this.id = id;
        this.username = username;
        this.name = name;
        this.userType = userType;
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

    public UserType getUserType() {
        return userType;
    }

    public String getId() {
        return id;
    }

    public boolean isCustomer() {
        return userType == UserType.CUSTOMER;
    }

    public boolean isMerchant() {
        return userType == UserType.MERCHANT;
    }
}
