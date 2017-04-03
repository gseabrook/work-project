package com.ebikko.mandate;

import com.ebikko.mandate.model.*;
import com.ebikko.mandate.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.ebikko.mandate.builder.CustomerBankAccountBuilder.exampleCustomerBankAccount;
import static com.ebikko.mandate.builder.CustomerBuilder.exampleCustomer;
import static com.ebikko.mandate.builder.MandateBuilder.exampleMandate;
import static com.ebikko.mandate.builder.MerchantBankAccountBuilder.exampleMerchantBankAccount;
import static com.ebikko.mandate.builder.MerchantBuilder.exampleMerchant;

@Service
public class TestDataService {

    @Autowired
    private MandateService mandateService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerBankAccountService customerBankAccountService;
    @Autowired
    private MerchantBankAccountService merchantBankAccountService;
    @Autowired
    private MerchantService merchantService;

    public Mandate createMandate(Customer customer) {
        return createMandate(customer, createMerchant());
    }

    public Mandate createMandate(Merchant merchant) {
        return createMandate(createCustomer(), merchant);
    }

    public Mandate createMandate(Customer customer, Merchant merchant) {
        Mandate mandate = exampleMandate(customer, merchant);
        return mandateService.save(mandate);
    }

    public Mandate createMandate() {
        return createMandate(createCustomer(), createMerchant());
    }

    public Merchant createMerchant() {
        MerchantBankAccount merchantBankAccount = merchantBankAccountService.save(exampleMerchantBankAccount());

        return merchantService.save(exampleMerchant(merchantBankAccount));
    }

    public Customer createCustomer() {
        CustomerBankAccount customerBankAccount = customerBankAccountService.save(exampleCustomerBankAccount());

        return customerService.save(exampleCustomer(customerBankAccount));
    }
}
