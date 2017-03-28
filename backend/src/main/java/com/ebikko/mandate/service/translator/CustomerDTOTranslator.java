package com.ebikko.mandate.service.translator;

import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.CustomerBankAccount;
import com.ebikko.mandate.service.BankService;
import com.ebikko.mandate.web.dto.BankAccountDTO;
import com.ebikko.mandate.web.dto.CustomerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.ebikko.mandate.model.IDType.valueOf;
import static com.google.common.collect.Lists.newArrayList;

@Service
public class CustomerDTOTranslator {

    private final BankService bankService;

    @Autowired
    public CustomerDTOTranslator(BankService bankService) {
        this.bankService = bankService;
    }

    public Customer translate(CustomerDTO customerDTO) {
        Customer customer = new Customer();
        customer.setName(customerDTO.getName());
        customer.setEmailAddress(customerDTO.getEmailAddress());
        customer.setPhoneNumber(customerDTO.getPhoneNumber());
        customer.setIdValue(customerDTO.getIdValue());
        customer.setIdType(valueOf(customerDTO.getIdType()));

        BankAccountDTO bankAccount = customerDTO.getBankAccount();
        Bank bank = bankService.getBank(bankAccount.getBankId());

        CustomerBankAccount customerBankAccount = new CustomerBankAccount(bank, bankAccount.getAccountNumber());
        customer.setBankAccounts(newArrayList(customerBankAccount));

        return customer;
    }
}
