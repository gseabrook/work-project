package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.service.translator.CustomerDTOTranslator;
import com.ebikko.mandate.web.dto.CustomerDTO;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

@Service
public class CustomerResolver {

    private final ApplicationEventPublisher applicationEventPublisher;
    private final CustomerService customerService;
    private final CustomerDTOTranslator customerDTOTranslator;

    public CustomerResolver(ApplicationEventPublisher applicationEventPublisher, CustomerService customerService, CustomerDTOTranslator customerDTOTranslator) {
        this.applicationEventPublisher = applicationEventPublisher;
        this.customerService = customerService;
        this.customerDTOTranslator = customerDTOTranslator;
    }

    public Customer resolveCustomer(CustomerDTO customerDTO) {
        Customer customer = customerService.getCustomerByEmailAddress(customerDTO.getEmailAddress());

        if (customer == null) {
            customer = customerService.getCustomer(customerDTO.getIdValue(), customerDTO.getIdType());
        }

        if (customer == null) {
            customer = customerDTOTranslator.translate(customerDTO);
            customerService.save(customer);
        }

        return customer;
    }
}
