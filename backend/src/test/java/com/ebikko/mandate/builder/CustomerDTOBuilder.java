package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.web.dto.CustomerDTO;

public class CustomerDTOBuilder {

    public static CustomerDTO customerDTO(Customer customer) {
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setName(customer.getName());
        customerDTO.setEmailAddress(customer.getEmailAddress());
        customerDTO.setIdType(customer.getIdType().toString());
        customerDTO.setIdValue(customer.getIdValue().toString());
        customerDTO.setPhoneNumber(customer.getPhoneNumber());
        return customerDTO;
    }
}
