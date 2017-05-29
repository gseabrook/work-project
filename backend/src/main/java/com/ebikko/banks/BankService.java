package com.ebikko.banks;

import com.ebikko.mandate.model.Bank;
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
