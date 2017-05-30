package com.ebikko.mandate.service;

import com.ebikko.mandate.model.MandateStatus;
import com.ebikko.mandate.repository.MandateStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MandateStatusService {

    private final MandateStatusRepository mandateStatusRepository;

    @Autowired
    public MandateStatusService(MandateStatusRepository mandateStatusRepository) {
        this.mandateStatusRepository = mandateStatusRepository;
    }

    public MandateStatus getMandateStatus(String code) {
        return mandateStatusRepository.findByCode(code);
    }
}
