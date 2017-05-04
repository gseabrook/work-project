package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.web.dto.MandateDTO;

import static com.ebikko.mandate.builder.BankAccountDTOBuilder.bankAccountDTO;
import static com.ebikko.mandate.builder.CustomerDTOBuilder.customerDTO;

public class MandateDTOBuilder {

    public static MandateDTO mandateDTO(Mandate mandate) {
        MandateDTO mandateDTO = new MandateDTO();
        if (mandate.getId() != null) {
            mandateDTO.setId(mandate.getId().toString());
        }
        mandateDTO.setReferenceNumber(mandate.getReferenceNumber());
        mandateDTO.setRegistrationDate(mandate.getRegistrationDate());
        mandateDTO.setAmount(mandate.getAmount());
        mandateDTO.setFrequency(mandate.getFrequency().toString());
        mandateDTO.setCustomer(customerDTO(mandate.getCustomer()));
        if (mandate.getCustomerBankAccount() != null) {
            mandateDTO.setCustomerBankAccount(bankAccountDTO(mandate.getCustomerBankAccount()));
        }
        return mandateDTO;
    }
}
