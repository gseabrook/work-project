package com.ebikko.mandate.service.translator;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.web.dto.CustomerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.ebikko.mandate.model.IDType.valueOf;

@Service
public class CustomerDTOTranslator {

    @Autowired
    public CustomerDTOTranslator() {
    }

    public Customer translate(CustomerDTO customerDTO) {
        Customer customer = new Customer();
        customer.setName(customerDTO.getName());
        customer.setEmailAddress(customerDTO.getEmailAddress());
        customer.setPhoneNumber(customerDTO.getPhoneNumber());
        customer.setIdValue(customerDTO.getIdValue());
        customer.setIdType(valueOf(customerDTO.getIdType()));
        return customer;
    }
}
