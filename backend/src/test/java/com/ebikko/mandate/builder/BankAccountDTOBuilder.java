package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.CustomerBankAccount;
import com.ebikko.mandate.web.dto.BankAccountDTO;

public class BankAccountDTOBuilder {

    public static BankAccountDTO bankAccountDTO(CustomerBankAccount customerBankAccount) {
        BankAccountDTO bankAccountDTO = new BankAccountDTO();
        bankAccountDTO.setAccountNumber(customerBankAccount.getAccountNumber());
        bankAccountDTO.setBankId(customerBankAccount.getBank().getId());
        return bankAccountDTO;
    }

    public static BankAccountDTO exampleBankAccountDTO() {
        BankAccountDTO bankAccountDTO = new BankAccountDTO();
        bankAccountDTO.setBankId(5l);
        bankAccountDTO.setAccountNumber("12323537");
        return bankAccountDTO;
    }

}
