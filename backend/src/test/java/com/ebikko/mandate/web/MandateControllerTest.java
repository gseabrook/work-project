package com.ebikko.mandate.web;

import com.ebikko.mandate.model.*;
import com.ebikko.mandate.service.MandateService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.math.BigDecimal;

import static com.ebikko.mandate.MandateBuilder.exampleMandate;
import static com.ebikko.mandate.web.MandateController.MANDATE_URL;
import static org.exparity.hamcrest.date.DateMatchers.isMarch;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(MockitoJUnitRunner.class)
public class MandateControllerTest {

    private MockMvc mockMvc;
    @Mock
    private MandateService mandateService;

    @Before
    public void setUp() throws Exception {
        MandateController mandateController = new MandateController(mandateService);
        mockMvc = MockMvcBuilders.standaloneSetup(mandateController).build();
    }

    @Test
    public void shouldSaveMandate() throws Exception {

        mockMvc.perform(
                post(MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandate().toJson()))
                .andExpect(status().isCreated());

        ArgumentCaptor<Mandate> captor = ArgumentCaptor.forClass(Mandate.class);
        verify(mandateService).save(captor.capture());
        Mandate savedMandate = captor.getValue();

        assertThat(savedMandate.getReferenceNumber(), is("123abc"));
        assertThat(savedMandate.getRegistrationDate(), isMarch());
        assertThat(savedMandate.getAmount(), is(new BigDecimal("123.45")));
        assertThat(savedMandate.getFrequency(), is(MandateFrequency.MONTHLY));

        Customer customer = savedMandate.getCustomer();
        assertThat(customer.getName(), is("Joe"));
        assertThat(customer.getEmailAddress(), is("test@example.com"));
        assertThat(customer.getIdType(), is(IDType.PASSPORT_NUMBER));
        assertThat(customer.getIdValue(), is("123456"));

        CustomerBankAccount customerBankAccount = customer.getBankAccounts().get(0);
        assertThat(customerBankAccount.getBank().getName(), is("HSBC"));
        assertThat(customerBankAccount.getAccountNumber(), is("242536"));
    }
}