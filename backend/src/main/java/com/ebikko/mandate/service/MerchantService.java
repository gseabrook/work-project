package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.repository.MerchantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MerchantService {

    private final MerchantRepository merchantRepository;

    @Autowired
    public MerchantService(MerchantRepository merchantRepository) {
        this.merchantRepository = merchantRepository;
    }

    public Merchant getMerchant(String id) {
        return getMerchant(Long.valueOf(id));
    }

    public Merchant getMerchant(Long id) {
        return merchantRepository.findOne(id);
    }

    public Merchant save(Merchant merchant) {
        return merchantRepository.save(merchant);
    }

}
