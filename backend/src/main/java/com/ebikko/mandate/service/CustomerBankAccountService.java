package com.ebikko.mandate.service;

import com.ebikko.mandate.model.CustomerBankAccount;
import com.ebikko.mandate.repository.CustomerBankAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerBankAccountService {

    private final CustomerBankAccountRepository customerBankAccountRepository;

    @Autowired
    public CustomerBankAccountService(CustomerBankAccountRepository customerBankAccountRepository) {
        this.customerBankAccountRepository = customerBankAccountRepository;
    }

    public CustomerBankAccount save(CustomerBankAccount customerBankAccount) {
        return customerBankAccountRepository.save(customerBankAccount);
    }
}
