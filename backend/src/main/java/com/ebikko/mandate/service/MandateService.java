package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.repository.MandateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MandateService {

    private final MandateRepository mandateRepository;

    @Autowired
    public MandateService(MandateRepository mandateRepository) {
        this.mandateRepository = mandateRepository;
    }

    public Mandate save(final Mandate mandate) {
        return mandateRepository.save(mandate);
    }

    public List<Mandate> getMandates(Merchant merchant) {
        return mandateRepository.findByMerchant(merchant);
    }

    public Mandate getMandate(Long id) {
        return mandateRepository.findOne(id);
    }
}
