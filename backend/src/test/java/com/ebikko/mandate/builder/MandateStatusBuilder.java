package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.MandateStatus;

public class MandateStatusBuilder {

    public static MandateStatus authorised() {
        return of(1l, "00", "Approved");
    }

    public static MandateStatus pendingFpxProcessing() {
        return of(76l, "-1", "Awaiting FPX processing");
    }

    private static MandateStatus of(Long id, String code, String description) {
        MandateStatus status = new MandateStatus();
        status.setId(id);
        status.setCode(code);
        status.setDescription(description);
        return status;
    }
}
