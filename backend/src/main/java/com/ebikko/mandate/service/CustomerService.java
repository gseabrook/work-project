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

    public Customer getCustomerByEmailAddress(String emailAddress) {
        return customerRepository.findByEmailAddress(emailAddress);
    }

    public Customer getCustomer(String id) {
        return customerRepository.findOne(Long.valueOf(id));
    }

    public Customer save(String emailAddress) {
        Customer customer = new Customer();
        customer.setEmailAddress(emailAddress);
        customer.setName(emailAddress);
        return save(customer);
    }
}
