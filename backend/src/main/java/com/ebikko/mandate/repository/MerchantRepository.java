package com.ebikko.mandate.repository;

import com.ebikko.mandate.model.Merchant;
import org.springframework.data.repository.CrudRepository;

public interface MerchantRepository extends CrudRepository<Merchant, Long> {
}
