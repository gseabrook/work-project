package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Mandate;
import ebikko.EbikkoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MandateService {

    @Autowired
    public MandateService() {

    }

    public void save(Mandate mandate) throws EbikkoException {

    }
}
