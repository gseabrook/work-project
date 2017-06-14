package com.ebikko.mandate.web;

import com.ebikko.mandate.builder.MandateDTOBuilder;
import com.ebikko.mandate.model.*;
import com.ebikko.mandate.web.dto.MandateDTO;
import com.ebikko.signup.UserVerificationToken;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hamcrest.Matchers;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import java.util.List;
import java.util.Map;

import static com.ebikko.mandate.builder.CustomerDTOBuilder.customerDtoBuilder;
import static com.ebikko.mandate.builder.MandateBuilder.exampleMandateBuilder;
import static com.ebikko.mandate.model.MandateStatus.AWAITING_FPX_AUTHORISATION;
import static com.ebikko.mandate.model.MandateStatus.NEW;
import static com.ebikko.mandate.responsematcher.ValidationErrorResponseMatchers.response;
import static com.ebikko.mandate.web.MerchantController.MERCHANT_MANDATE_URL;
import static com.ebikko.mandate.web.MerchantController.MERCHANT_URL;
import static com.google.common.collect.Iterables.size;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Matchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyZeroInteractions;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.authentication;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MerchantControllerDBTest extends AbstractEmbeddedDBControllerTest {

    private Merchant merchant;
    private User user;

    @Before
    public void setUp() throws Exception {
        merchant = testDataService.createMerchant();

        user = new User("1", merchant.getId().toString(), "user", "Name", User.UserType.MERCHANT, "name@merchant.com");
        super.setAuthenticationPrincipal(user);
    }

    @After
    public void tearDown() throws Exception {
        testDataService.resetPrincipals();
    }

    @Test
    public void shouldRetrieveMerchantInformation() throws Exception {
        String contentAsString = mockMvc
                .perform(get(MERCHANT_URL + "/" + merchant.getId()).with(user("Bob")))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        Merchant response = new ObjectMapper().readValue(contentAsString, Merchant.class);

        assertThat(response.getCompanyRegistrationNumber(), is(merchant.getCompanyRegistrationNumber()));
        assertThat(response.getCompanyName(), is(merchant.getCompanyName()));
    }

    @Test
    public void shouldRetrieveMandatesForMerchant() throws Exception {
        Mandate mandate = testDataService.createMandate();

        String contentAsString = mockMvc
                .perform(get(MERCHANT_URL + "/" + mandate.getMerchant().getId() + MERCHANT_MANDATE_URL).with(user("Bob")))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        List list = new ObjectMapper().readValue(contentAsString, List.class);

        assertThat(list.size(), is(1));
    }

    @Test
    public void shouldCreateMandateForMerchant() throws Exception {
        String json = exampleMandateDTO(AWAITING_FPX_AUTHORISATION, "abc-def-123");

        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
        ).andExpect(status().isCreated());

        List<Mandate> mandates = mandateService.getMandates(merchant);
        assertThat(mandates, hasSize(1));

        Merchant savedMerchant = merchantService.getMerchant(merchant.getId());
        assertThat(savedMerchant.getMandates(), hasSize(1));

        Mandate mandate = mandates.get(0);
        assertThat(mandate.getCustomerBankAccount().getAccountNumber(), is("12323537"));
        assertThat(mandate.getStatus(), is(AWAITING_FPX_AUTHORISATION));

        Customer customer = customerService.get("456789123", IDType.PASSPORT_NUMBER);

        Map<String, Object> map = jdbcTemplate.queryForMap("select * from principal where email = 'joe@example.com'");
        assertThat(map.get("email"), Matchers.<Object>is("joe@example.com"));
        assertThat(map.get("ptype"), Matchers.<Object>is(5));
        assertThat(map.get("isgroup"), Matchers.<Object>is(0));
        assertThat(map.get("canlogin"), Matchers.<Object>is(0));
        assertThat(map.get("jc2300d55f3547e3a495f6332e259604"), Matchers.<Object>is(customer.getId().toString()));

        String userId = (String) map.get("uid");
        UserVerificationToken token = userVerificationTokenRepository.findByPrincipalUid(userId);
        assertNotNull(token);

        assertThat(customer.getName(), is("Joe"));
        assertThat(customer.getPrincipalUid(), is(userId));
        assertThat(customer.getBankAccounts(), hasSize(1));
        assertThat(customer.getMandates(), hasSize(1));

        verify(emailService).sendNewCustomerEmail(any(UserVerificationToken.class), any(Customer.class));
        verify(nodeService).saveNode(any(Mandate.class));
    }

    @Test
    public void shouldLinkMandatesWithExistingCustomer() throws Exception {
        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .content(exampleMandateDTO(AWAITING_FPX_AUTHORISATION, "abc-1"))
                        .contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
        ).andExpect(status().isCreated());

        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .content(exampleMandateDTO(AWAITING_FPX_AUTHORISATION, "abc-2"))
                        .contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
        ).andExpect(status().isCreated());

        Iterable<Customer> customers = customerRepository.findAll();
        assertThat(size(customers), is(1));

        Customer customer = customers.iterator().next();
        assertThat(customer.getBankAccounts(), hasSize(1));

        verify(emailService, times(2)).sendNewCustomerEmail(any(UserVerificationToken.class), any(Customer.class));
    }

    @Test
    public void shouldRejectMandateWithDuplicateReferenceNumber() throws Exception {
        Mandate mandate = testDataService.createMandate();
        Merchant merchant = mandate.getMerchant();

        User user = new User("1", merchant.getId().toString(), "user", "Name", User.UserType.MERCHANT, "name@merchant.com");
        super.setAuthenticationPrincipal(user);

        String json = exampleMandateDTO(AWAITING_FPX_AUTHORISATION, mandate.getReferenceNumber());

        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
        ).andExpect(status().isUnprocessableEntity());
    }

    @Test
    public void shouldSupportMandatesWithoutCustomerBankInformation() throws Exception {

        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .content(exampleMandateBuilder().with("status", NEW.toString()).toJson())
                        .contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
        ).andExpect(status().isCreated());

        Mandate mandate = mandateService.getMandates(merchant).get(0);
        assertThat(mandate.getStatus(), is(NEW));
    }

    @Test
    public void shouldSupportMandatesWithoutReferenceNumber() throws Exception {
        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .content(exampleMandateBuilder().with("referenceNumber", null).toJson())
                        .contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
        ).andExpect(status().isCreated());

        verifyZeroInteractions(emailService);
    }

    @Test
    public void shouldRejectCustomerWithoutRequiredFields() throws Exception {
        MandateDTO mandateDTO = MandateDTOBuilder.exampleMandateDTO();
        mandateDTO.setCustomer(customerDtoBuilder().withEmailAddress(null).build());

        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .content(toJson(mandateDTO))
                        .contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
        ).andExpect(status().isUnprocessableEntity());
    }

    @Test
    public void shouldRejectEmptyAmount() throws Exception {
        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().with("amount", "").toJson())
                    .with(authentication(new UsernamePasswordAuthenticationToken(user, ""))))
                .andExpect(response().hasErrorForField("amount", "Amount cannot be blank"))
                .andExpect(status().is4xxClientError());
    }

    @Test
    public void shouldRejectMissingAmount() throws Exception {
        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().without("amount").toJson())
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, ""))))
                .andExpect(response().hasErrorForField("amount", "Amount cannot be blank"))
                .andExpect(status().is4xxClientError());
    }

    @Test
    public void shouldRejectNonNumericAmount() throws Exception {
        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().with("amount", "abc-123").toJson())
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, ""))))
                .andExpect(response().hasErrorForField("amount", "'abc-123' is not a valid Amount"))
                .andExpect(status().is4xxClientError());
    }

    @Test
    public void shouldRejectZeroAmount() throws Exception {
        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().with("amount", "0.00").toJson())
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, ""))))
                .andExpect(response().hasErrorForField("amount", "Amount must be greater than 0"))
                .andExpect(status().is4xxClientError());
    }


    private String toJson(MandateDTO mandateDTO) {
        try {
            String string = new ObjectMapper().writeValueAsString(mandateDTO);
            return string.replaceAll("'", "\"");
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    private String exampleMandateDTO(MandateStatus status, String referenceNumber) {
        MandateDTO mandateDTO = MandateDTOBuilder.exampleMandateDTO(referenceNumber);
        mandateDTO.setStatus(status.toString());
        return toJson(mandateDTO);
    }
}
