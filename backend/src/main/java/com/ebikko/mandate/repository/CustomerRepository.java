package com.ebikko.mandate.repository;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.IDType;
import org.springframework.data.repository.CrudRepository;

public interface CustomerRepository extends CrudRepository<Customer, Long> {

    Customer findByIdValueAndIdType(String idValue, IDType idType);

    Customer findByEmailAddress(String emailAddress);

}
