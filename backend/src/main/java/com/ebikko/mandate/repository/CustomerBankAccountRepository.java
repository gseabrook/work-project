package com.ebikko.mandate.repository;

import com.ebikko.mandate.model.CustomerBankAccount;
import org.springframework.data.repository.CrudRepository;

public interface CustomerBankAccountRepository extends CrudRepository<CustomerBankAccount, Long> {
}
