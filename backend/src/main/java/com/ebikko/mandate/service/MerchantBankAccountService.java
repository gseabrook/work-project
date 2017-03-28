package com.ebikko.mandate.service;

import com.ebikko.mandate.model.MerchantBankAccount;
import com.ebikko.mandate.repository.MerchantBankAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MerchantBankAccountService {

    private final MerchantBankAccountRepository merchantBankAccountRepository;

    @Autowired
    public MerchantBankAccountService(MerchantBankAccountRepository merchantBankAccountRepository) {
        this.merchantBankAccountRepository = merchantBankAccountRepository;
    }

    public MerchantBankAccount save(MerchantBankAccount merchantBankAccount) {
        return merchantBankAccountRepository.save(merchantBankAccount);
    }
}
