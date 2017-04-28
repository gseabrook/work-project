package com.ebikko.mandate.model.event;

import com.ebikko.mandate.model.Mandate;

public class MandateCreatedEvent {

    private final Mandate mandate;

    public MandateCreatedEvent(Mandate mandate) {
        this.mandate = mandate;
    }

    public Mandate getMandate() {
        return mandate;
    }
}
