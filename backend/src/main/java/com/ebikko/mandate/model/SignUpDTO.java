package com.ebikko.mandate.model;

public class SignUpDTO {
    private String email;
    private String password;

    public SignUpDTO() {
    }

    public SignUpDTO(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
}
