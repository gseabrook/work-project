package com.ebikko.mandate.service.translator;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.MandateFrequency;
import com.ebikko.mandate.web.dto.MandateDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MandateDTOTranslator {

    private final CustomerDTOTranslator customerDTOTranslator;

    @Autowired
    public MandateDTOTranslator(CustomerDTOTranslator customerDTOTranslator) {
        this.customerDTOTranslator = customerDTOTranslator;
    }

    public Mandate translate(MandateDTO mandateDTO) {
        Mandate mandate = new Mandate();
        mandate.setReferenceNumber(mandateDTO.getReferenceNumber());
        mandate.setRegistrationDate(mandateDTO.getRegistrationDate());
        mandate.setAmount(mandateDTO.getAmount());
        mandate.setFrequency(MandateFrequency.valueOf(mandateDTO.getFrequency()));

        Customer customer = customerDTOTranslator.translate(mandateDTO.getCustomer());
        mandate.setCustomer(customer);

        return mandate;
    }
}
