package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.web.dto.CustomerDTO;

public class CustomerDTOBuilder {

    private String emailAddress;

    public CustomerDTOBuilder withEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
        return this;
    }

    public CustomerDTO build() {
        CustomerDTO customerDTO = exampleCustomerDTO();
        customerDTO.setEmailAddress(emailAddress);
        return customerDTO;
    }

    public static CustomerDTOBuilder customerDtoBuilder() {
        return new CustomerDTOBuilder();
    }

    public static CustomerDTO customerDTO(Customer customer) {
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setName(customer.getName());
        customerDTO.setEmailAddress(customer.getEmailAddress());
        customerDTO.setIdType(customer.getIdType().toString());
        customerDTO.setIdValue(customer.getIdValue().toString());
        customerDTO.setPhoneNumber(customer.getPhoneNumber());
        return customerDTO;
    }

    public static CustomerDTO exampleCustomerDTO() {
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setName("Joe");
        customerDTO.setEmailAddress("joe@example.com");
        customerDTO.setIdType("PASSPORT_NUMBER");
        customerDTO.setIdValue("456789123");
        return customerDTO;
    }

}
