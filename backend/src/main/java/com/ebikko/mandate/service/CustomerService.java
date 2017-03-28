package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.IDType;
import com.ebikko.mandate.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;

    @Autowired
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public Customer save(Customer customer) {
        return customerRepository.save(customer);
    }

    public Customer get(String idValue, IDType idType) {
        return customerRepository.findByIdValueAndIdType(idValue, idType);
    }
}
