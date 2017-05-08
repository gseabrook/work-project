package com.ebikko.mandate.service.translator;

import com.ebikko.mandate.model.*;
import com.ebikko.mandate.service.BankService;
import com.ebikko.mandate.service.CustomerResolver;
import com.ebikko.mandate.web.dto.BankAccountDTO;
import com.ebikko.mandate.web.dto.MandateDTO;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MandateDTOTranslator {

    private final CustomerResolver customerResolver;
    private final BankService bankService;

    @Autowired
    public MandateDTOTranslator(CustomerResolver customerResolver, BankService bankService) {
        this.customerResolver = customerResolver;
        this.bankService = bankService;
    }

    public Mandate translate(MandateDTO mandateDTO) {
        Mandate mandate = new Mandate();
        if (!StringUtils.isBlank(mandateDTO.getId())) {
            mandate.setId(Long.valueOf(mandateDTO.getId()));
        }
        mandate.setReferenceNumber(mandateDTO.getReferenceNumber());
        mandate.setRegistrationDate(mandateDTO.getRegistrationDate());
        mandate.setAmount(mandateDTO.getAmount());
        mandate.setFrequency(MandateFrequency.valueOf(mandateDTO.getFrequency()));

        Customer customer = customerResolver.resolveCustomer(mandateDTO.getCustomer(), mandateDTO.getCustomerBankAccount());

        BankAccountDTO bankAccountDTO = mandateDTO.getCustomerBankAccount();
        if (bankAccountDTO != null && bankAccountDTO.getBankId() != null) {
            Bank bank = bankService.getBank(bankAccountDTO.getBankId());
            CustomerBankAccount customerBankAccount = new CustomerBankAccount(bank, bankAccountDTO.getAccountNumber());
            mandate.setCustomerBankAccount(customerBankAccount);
            mandate.setStatus(MandateStatus.AUTHORISED);
        } else {
            mandate.setStatus(MandateStatus.PENDING_AUTHORISATION);
        }

        mandate.setCustomer(customer);
        customer.addMandate(mandate);

        return mandate;
    }
}
