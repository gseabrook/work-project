package com.ebikko.mandate.repository;

import com.ebikko.mandate.model.Bank;
import org.springframework.data.repository.CrudRepository;

public interface BankRepository extends CrudRepository<Bank, Long> {
}
