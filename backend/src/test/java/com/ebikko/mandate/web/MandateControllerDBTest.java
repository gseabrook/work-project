package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.CustomerBankAccount;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.web.dto.MandateDTO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Iterables;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.http.MediaType;

import static com.ebikko.mandate.builder.CustomerBankAccountBuilder.exampleCustomerBankAccount;
import static com.ebikko.mandate.builder.MandateDTOBuilder.mandateDTO;
import static com.ebikko.mandate.web.MandateController.MANDATE_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MandateControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Test
    public void shouldLoadMandateByUid() throws Exception {
        Mandate mandate = testDataService.createMandate();

        mockMvc
                .perform(get(MANDATE_URL + "/" + mandate.getId()))
                .andExpect(status().isOk());
    }

    @Ignore("Ignoring this as the authorisation will be driven by messages we receive from FPX, so don't think this makes sense")
    @Test
    public void shouldUpdateMandateWithCustomerBankInformation() throws Exception {
        Mandate mandate = testDataService.createPendingMandate();

        CustomerBankAccount customerBankAccount = exampleCustomerBankAccount();
        customerBankAccount.setId(null);
        mandate.setCustomerBankAccount(customerBankAccount);

        MandateDTO mandateDTO = mandateDTO(mandate);
        mandateDTO.setStatus("AUTHORISED");

        mockMvc
                .perform(
                        put(MANDATE_URL + "/" + mandate.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(mandateDTO))
                )
                .andExpect(status().isNoContent());

        Mandate savedMandate = mandateService.getMandate(mandate.getId());
        assertThat(savedMandate.getCustomerBankAccount().getAccountNumber(), is(customerBankAccount.getAccountNumber()));

        assertThat(Iterables.size(mandateRepository.findAll()), is(1));

        Customer savedCustomer = customerService.getCustomerById(mandate.getCustomer().getId());
        assertThat(savedCustomer.getBankAccounts().size(), is(1));
    }

    @Test
    public void shouldEmailTheCustomerWhenMandateIsTerminated() throws Exception {
        Mandate mandate = testDataService.createMandate();
        MandateDTO mandateDTO = mandateDTO(mandate);
        mandateDTO.setStatus("BC");

        mockMvc
                .perform(
                        put(MANDATE_URL + "/" + mandate.getId())
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(new ObjectMapper().writeValueAsString(mandateDTO))
                )
                .andExpect(status().isNoContent());

        Mandate savedMandate = mandateService.getMandate(mandate.getId());
        assertTrue(savedMandate.getStatus().isCancelled());

        verify(emailService).sendCustomerMandateTerminatedEmail(savedMandate);
    }
}