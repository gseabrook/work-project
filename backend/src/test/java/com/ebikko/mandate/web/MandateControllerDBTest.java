package com.ebikko.mandate.web;

import com.ebikko.mandate.model.*;
import com.ebikko.mandate.web.dto.MandateDTO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Iterables;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import static com.ebikko.mandate.builder.CustomerBankAccountBuilder.exampleCustomerBankAccount;
import static com.ebikko.mandate.builder.MandateDTOBuilder.mandateDTO;
import static com.ebikko.mandate.model.MandateStatus.AWAITING_FPX_AUTHORISATION;
import static com.ebikko.mandate.model.MandateStatus.AWAITING_FPX_TERMINATION;
import static com.ebikko.mandate.web.MandateController.MANDATE_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.mockito.Matchers.any;
import static org.mockito.Mockito.verify;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.authentication;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MandateControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Test
    public void shouldLoadMandateByUid() throws Exception {
        Mandate mandate = testDataService.createMandate();

        mockMvc
                .perform(get(MANDATE_URL + "/" + mandate.getId()))
                .andExpect(status().isOk());
    }

    @Test
    public void shouldUpdateMandateWithCustomerBankInformation() throws Exception {
        Customer activeCustomer = testDataService.createActiveCustomer();
        Mandate mandate = testDataService.createMandate(activeCustomer);

        CustomerBankAccount customerBankAccount = exampleCustomerBankAccount();
        customerBankAccount.setId(null);
        mandate.setCustomerBankAccount(customerBankAccount);

        MandateDTO mandateDTO = mandateDTO(mandate);
        mandateDTO.setStatus(AWAITING_FPX_AUTHORISATION.toString());

        User user = new User("1", mandate.getBuyer().getId().toString(), "user", "Name", User.UserType.CUSTOMER, "name@customer.com");
        super.setAuthenticationPrincipal(user);

        mockMvc
                .perform(
                        put(MANDATE_URL + "/" + mandate.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(mandateDTO))
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
                )
                .andExpect(status().isOk())
                .andExpect(header().string("Location", "http://fpx.admessage.com"));

        Mandate savedMandate = mandateService.getMandate(mandate.getId());
        assertThat(savedMandate.getCustomerBankAccount().getAccountNumber(), is(customerBankAccount.getAccountNumber()));
        assertThat(savedMandate.getStatus(), is(MandateStatus.AWAITING_FPX_AUTHORISATION));

        assertThat(Iterables.size(mandateRepository.findAll()), is(1));

        Customer savedCustomer = customerService.getCustomerById(mandate.getBuyer().getId());
        assertThat(savedCustomer.getBankAccounts().size(), is(1));

        verify(emailService).sendCustomerMandateAuthorisationRequestedEmail(any(Mandate.class));
    }

    @Test
    public void shouldTerminateMandate() throws Exception {
        Mandate mandate = testDataService.createMandate();

        mockMvc
                .perform(
                        delete(MANDATE_URL + "/" + mandate.getId())
                )
                .andExpect(status().isOk())
                .andExpect(header().string("Location", "http://fpx.admessage.com"));

        Mandate savedMandate = mandateService.getMandate(mandate.getId());
        assertThat(savedMandate.getStatus(), is(AWAITING_FPX_TERMINATION));
    }

    @Test
    public void shouldEmailTheCustomerWhenMandateIsTerminated() throws Exception {
        Mandate mandate = testDataService.createMandate();
        MandateDTO mandateDTO = mandateDTO(mandate);
        mandateDTO.setStatus(AWAITING_FPX_TERMINATION.toString());

        User user = new User("1", mandate.getBuyer().getId().toString(), "user", "Name", User.UserType.CUSTOMER, "name@customer.com");
        super.setAuthenticationPrincipal(user);

        mockMvc
                .perform(
                        put(MANDATE_URL + "/" + mandate.getId())
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(new ObjectMapper().writeValueAsString(mandateDTO))
                                .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
                )
                .andExpect(status().isOk());

        Mandate savedMandate = mandateService.getMandate(mandate.getId());
        assertThat(savedMandate.getStatus(), is(AWAITING_FPX_TERMINATION));

        verify(emailService).sendCustomerMandateTerminationRequested(savedMandate);
    }
}