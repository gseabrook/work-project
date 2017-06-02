package com.ebikko.mandate.service.translator;

import com.ebikko.banks.BankService;
import com.ebikko.mandate.model.*;
import com.ebikko.mandate.service.CustomerResolver;
import com.ebikko.mandate.web.dto.BankAccountDTO;
import com.ebikko.mandate.web.dto.MandateDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

import static org.apache.commons.lang3.StringUtils.isBlank;

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

        if (!isBlank(mandateDTO.getId())) {
            mandate.setId(Long.valueOf(mandateDTO.getId()));
        }
        if (!isBlank(mandateDTO.getNodeId())) {
            mandate.setNodeId(mandateDTO.getNodeId());
        }

        mandate.setReferenceNumber(mandateDTO.getReferenceNumber());
        mandate.setRegistrationDate(mandateDTO.getRegistrationDate());
        mandate.setAmount(new BigDecimal(mandateDTO.getAmount()));
        mandate.setFrequency(MandateFrequency.valueOf(mandateDTO.getFrequency()));
        mandate.setStatus(MandateStatus.valueOf(mandateDTO.getStatus()));

        Customer customer = customerResolver.resolveCustomer(mandateDTO.getCustomer(), mandateDTO.getCustomerBankAccount());

        BankAccountDTO bankAccountDTO = mandateDTO.getCustomerBankAccount();
        if (bankAccountDTO != null && bankAccountDTO.getBankId() != null) {
            Bank bank = bankService.getBank(bankAccountDTO.getBankId());
            CustomerBankAccount customerBankAccount = new CustomerBankAccount(bank, bankAccountDTO.getAccountNumber());
            mandate.setCustomerBankAccount(customerBankAccount);
        }

        mandate.setCustomer(customer);
        customer.addMandate(mandate);
        return mandate;
    }
}
