package com.ebikko.mandate.web;

import com.ebikko.mandate.builder.MandateBuilder;
import com.ebikko.mandate.model.*;
import com.ebikko.mandate.service.MandateService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.springframework.http.MediaType;

import java.math.BigDecimal;
import java.util.Map;

import static com.ebikko.mandate.builder.MandateBuilder.exampleMandate;
import static com.ebikko.mandate.builder.MandateBuilder.exampleMandateBuilder;
import static com.ebikko.mandate.web.MandateController.MANDATE_URL;
import static org.exparity.hamcrest.date.DateMatchers.isMarch;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.core.Is.is;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MandateControllerTest extends AbstractControllerTest {

    @Mock
    private MandateService mandateService;

    @Override
    public Object getController() {
        return new MandateController(mandateService);
    }

    @Test
    public void shouldSaveMandate() throws Exception {

        MandateBuilder mandateBuilder = exampleMandateBuilder();
        Object referenceNumber = mandateBuilder.get("referenceNumber");
        Object customerIdValue = ((Map)mandateBuilder.get("customer")).get("idValue");

        mockMvc.perform(
                post(MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(mandateBuilder.toJson()))
                .andExpect(status().isCreated());

        ArgumentCaptor<Mandate> captor = ArgumentCaptor.forClass(Mandate.class);
        verify(mandateService).save(captor.capture());
        Mandate savedMandate = captor.getValue();

        assertThat(savedMandate.getReferenceNumber(), is(referenceNumber));
        assertThat(savedMandate.getRegistrationDate(), isMarch());
        assertThat(savedMandate.getAmount(), is(new BigDecimal("123.45")));
        assertThat(savedMandate.getFrequency(), is(MandateFrequency.MONTHLY));

        Customer customer = savedMandate.getCustomer();
        assertThat(customer.getName(), is("Joe"));
        assertThat(customer.getEmailAddress(), is("test@example.com"));
        assertThat(customer.getIdType(), is(IDType.PASSPORT_NUMBER));
        assertThat(customer.getIdValue(), is(customerIdValue));

        CustomerBankAccount customerBankAccount = customer.getBankAccounts().get(0);
        assertThat(customerBankAccount.getBank().getName(), is("HSBC"));
        assertThat(customerBankAccount.getAccountNumber(), is("242536"));
    }

    @Test
    public void shouldLoadMandate() throws Exception {
        Mandate exampleMandate = exampleMandate();
        given(mandateService.getMandate(123l)).willReturn(exampleMandate);

        String contentAsString = mockMvc.perform(
                get(MANDATE_URL + "/123"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        Mandate response = new ObjectMapper().readValue(contentAsString, Mandate.class);
        assertThat(exampleMandate, is(equalTo(response)));
    }
}