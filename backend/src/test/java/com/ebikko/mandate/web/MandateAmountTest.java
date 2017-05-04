package com.ebikko.mandate.web;

import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.translator.MandateDTOTranslator;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static com.ebikko.mandate.builder.MandateBuilder.exampleMandateBuilder;
import static com.ebikko.mandate.responsematcher.ValidationErrorResponseMatchers.response;
import static com.ebikko.mandate.web.MandateController.MANDATE_URL;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(MockitoJUnitRunner.class)
public class MandateAmountTest {

    private MockMvc mockMvc;
    @Mock
    private MandateService mandateService;
    @Mock
    private MandateDTOTranslator mandateDTOTranslator;
    @Mock
    private ApplicationEventPublisher applicationEventPublisher;

    @Before
    public void setUp() throws Exception {
        MandateController mandateController = new MandateController(mandateService, mandateDTOTranslator, applicationEventPublisher);
        mockMvc = MockMvcBuilders.standaloneSetup(mandateController).build();
    }

    @Test
    public void shouldRejectEmptyAmount() throws Exception {
        mockMvc.perform(
                post(MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().with("amount", "").toJson()))
                .andExpect(response().hasErrorForField("amount", "Amount cannot be blank"))
                .andExpect(status().is4xxClientError());
    }

    @Test
    public void shouldRejectMissingAmount() throws Exception {
        mockMvc.perform(
                post(MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().without("amount").toJson()))
                .andExpect(response().hasErrorForField("amount", "Amount cannot be blank"))
                .andExpect(status().is4xxClientError());
    }

    @Test
    public void shouldRejectNonNumericAmount() throws Exception {
        mockMvc.perform(
                post(MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().with("amount", "abc-123").toJson()))
                .andExpect(response().hasErrorForField("amount", "'abc-123' is not a valid amount"))
                .andExpect(status().is4xxClientError());
    }

    @Test
    public void shouldRejectZeroAmount() throws Exception {
        mockMvc.perform(
                post(MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().with("amount", "0.00").toJson()))
                .andExpect(response().hasErrorForField("amount", "Amount must be greater than 0"))
                .andExpect(status().is4xxClientError());
    }
}
