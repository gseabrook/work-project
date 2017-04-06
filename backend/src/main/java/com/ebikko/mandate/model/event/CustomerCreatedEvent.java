package com.ebikko.mandate.model.event;

import com.ebikko.mandate.model.Customer;

public class CustomerCreatedEvent {

    private final Customer customer;

    public CustomerCreatedEvent(Customer customer) {
        this.customer = customer;
    }

    public Customer getCustomer() {
        return customer;
    }
}
