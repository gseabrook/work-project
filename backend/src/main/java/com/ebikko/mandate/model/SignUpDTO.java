package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.hibernate.validator.constraints.NotBlank;

@PasswordsMatch
public class SignUpDTO {

    @NotBlank(message = "Please enter an email address")
    private final String email;
    @NotBlank
    private final String password;
    @NotBlank
    private final String repeatPassword;
    private final String token;

    @JsonCreator
    public SignUpDTO(@JsonProperty("email") String email,
                     @JsonProperty("password") String password,
                     @JsonProperty("repeatPassword") String repeatPassword,
                     @JsonProperty("token") String token) {
        this.email = email;
        this.password = password;
        this.repeatPassword = repeatPassword;
        this.token = token;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRepeatPassword() {
        return repeatPassword;
    }

    public String getToken() {
        return token;
    }
}
