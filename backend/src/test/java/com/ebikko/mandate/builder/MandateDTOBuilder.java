package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.MandateStatus;
import com.ebikko.mandate.web.dto.MandateDTO;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import static com.ebikko.mandate.builder.BankAccountDTOBuilder.bankAccountDTO;
import static com.ebikko.mandate.builder.BankAccountDTOBuilder.exampleBankAccountDTO;
import static com.ebikko.mandate.builder.CustomerDTOBuilder.customerDTO;
import static com.ebikko.mandate.builder.CustomerDTOBuilder.exampleCustomerDTO;
import static java.lang.String.valueOf;

public class MandateDTOBuilder {

    public static MandateDTO mandateDTO(Mandate mandate) {
        MandateDTO mandateDTO = new MandateDTO();
        if (mandate.getId() != null) {
            mandateDTO.setId(mandate.getId().toString());
        }
        mandateDTO.setReferenceNumber(mandate.getReferenceNumber());
        mandateDTO.setRegistrationDate(mandate.getRegistrationDate());
        mandateDTO.setAmount(valueOf(mandate.getAmount()));
        mandateDTO.setFrequency(mandate.getFrequency().toString());
        mandateDTO.setMaximumFrequency(String.valueOf(mandate.getMaximumFrequency()));
        mandateDTO.setCustomer(customerDTO((Customer) mandate.getBuyer()));
        if (mandate.getCustomerBankAccount() != null) {
            mandateDTO.setCustomerBankAccount(bankAccountDTO(mandate.getCustomerBankAccount()));
        }
        return mandateDTO;
    }

    public static MandateDTO exampleMandateDTO(String referenceNumber) {
        MandateDTO mandateDTO = new MandateDTO();
        mandateDTO.setReferenceNumber(referenceNumber);
        try {
            mandateDTO.setRegistrationDate(new SimpleDateFormat("yyyy-MM-dd").parse("2017-03-25"));
        } catch (ParseException e) {}
        mandateDTO.setAmount("123.45");
        mandateDTO.setFrequency("MONTHLY");
        mandateDTO.setMaximumFrequency("1");
        mandateDTO.setStatus(MandateStatus.NEW.getFpxId());
        mandateDTO.setCustomerBankAccount(exampleBankAccountDTO());
        mandateDTO.setCustomer(exampleCustomerDTO());
        return mandateDTO;
    }

    public static MandateDTO exampleMandateDTO() {
        return exampleMandateDTO("123-abc-def");
    }
}
