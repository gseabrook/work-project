package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.repository.BankRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BankService {

    private final BankRepository bankRepository;

    @Autowired
    public BankService(BankRepository bankRepository) {
        this.bankRepository = bankRepository;
    }

    public Iterable<Bank> getBanks() {
        return bankRepository.findAll();
    }

    public Bank getBank(Long id) {
        return bankRepository.findOne(id);
    }
}
