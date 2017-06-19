package com.ebikko.mandate.repository;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MandateRepository extends CrudRepository<Mandate, Long> {

    List<Mandate> findBySeller(Merchant seller);

    List<Mandate> findByBuyer(Customer customer);

    Mandate findBySellerAndReferenceNumber(Merchant seller, String referenceNumber);
}
