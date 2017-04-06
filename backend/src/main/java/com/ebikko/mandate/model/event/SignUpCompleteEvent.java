package com.ebikko.mandate.model.event;

import com.ebikko.mandate.model.User;

public class SignUpCompleteEvent {

    private final User user;

    public SignUpCompleteEvent(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }
}
