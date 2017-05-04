package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.CustomerBankAccount;
import com.ebikko.mandate.service.translator.CustomerDTOTranslator;
import com.ebikko.mandate.web.dto.BankAccountDTO;
import com.ebikko.mandate.web.dto.CustomerDTO;
import org.springframework.stereotype.Service;

@Service
public class CustomerResolver {

    private final BankService bankService;
    private final CustomerService customerService;
    private final CustomerDTOTranslator customerDTOTranslator;

    public CustomerResolver(BankService bankService, CustomerService customerService, CustomerDTOTranslator customerDTOTranslator) {
        this.bankService = bankService;
        this.customerService = customerService;
        this.customerDTOTranslator = customerDTOTranslator;
    }

    public Customer resolveCustomer(CustomerDTO customerDTO, BankAccountDTO bankAccountDTO) {
        Customer customer = customerService.getCustomerByEmailAddress(customerDTO.getEmailAddress());

        if (customer == null) {
            customer = customerService.getCustomer(customerDTO.getIdValue(), customerDTO.getIdType());
        }

        if (customer == null) {
            customer = customerDTOTranslator.translate(customerDTO);
        }

        if (bankAccountDTO != null && bankAccountDTO.getBankId() != null) {
            Bank bank = bankService.getBank(bankAccountDTO.getBankId());
            CustomerBankAccount customerBankAccount = new CustomerBankAccount(bank, bankAccountDTO.getAccountNumber());
            customer.addBankAccount(customerBankAccount);
        }

        customerService.save(customer);
        return customer;
    }
}
