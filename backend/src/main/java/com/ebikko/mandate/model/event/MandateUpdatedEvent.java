package com.ebikko.mandate.model.event;

import com.ebikko.mandate.model.Mandate;

public class MandateUpdatedEvent {

    private final Mandate mandate;

    public MandateUpdatedEvent(Mandate mandate) {
        this.mandate = mandate;
    }

    public Mandate getMandate() {
        return mandate;
    }
}
