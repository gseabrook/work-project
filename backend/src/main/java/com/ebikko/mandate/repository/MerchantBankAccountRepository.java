package com.ebikko.mandate.repository;

import com.ebikko.mandate.model.MerchantBankAccount;
import org.springframework.data.repository.CrudRepository;

public interface MerchantBankAccountRepository extends CrudRepository<MerchantBankAccount, Long> {
}
