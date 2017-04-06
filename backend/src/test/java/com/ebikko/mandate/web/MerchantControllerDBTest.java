package com.ebikko.mandate.web;

import com.ebikko.mandate.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hamcrest.Matchers;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import java.util.List;
import java.util.Map;

import static com.ebikko.mandate.web.MerchantController.MERCHANT_MANDATE_URL;
import static com.ebikko.mandate.web.MerchantController.MERCHANT_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Matchers.any;
import static org.mockito.Mockito.verify;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.authentication;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MerchantControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Test
    public void shouldRetrieveMerchantInformation() throws Exception {
        Merchant merchant = testDataService.createMerchant();

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
        Merchant merchant = testDataService.createMerchant();
        User user = new User("1", merchant.getId().toString(), "user", "Name", User.UserType.MERCHANT, "name@merchant.com");
        super.setAuthenticationPrincipal(user);

        String json = "{" +
                "'referenceNumber': '123-abc-def'," +
                "'registrationDate': '2017-03-25'," +
                "    'amount': '123.45'," +
                "    'frequency': 'MONTHLY'," +
                "    'customer': {" +
                    "    'name': 'Joe'," +
                    "    'emailAddress': 'joe@example.com'," +
                    "    'idType': 'PASSPORT_NUMBER'," +
                    "    'idValue': '456789123'," +
                    "    'bankAccount': {" +
                        "    'bankId': '5'," +
                        "    'accountNumber': '12323537'" +
                    "    }" +
                "    }" +
                "}";

        String json2 = json.replaceAll("'", "\"");
        System.out.println(json2);
        mockMvc.perform(
                post(MERCHANT_URL + MERCHANT_MANDATE_URL)
                        .content(json2)
                        .contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, "")))
        ).andExpect(status().isCreated());

        List<Mandate> mandates = mandateService.getMandates(merchant);
        assertThat(mandates, Matchers.hasSize(1));

        Customer customer = customerService.get("456789123", IDType.PASSPORT_NUMBER);
        assertThat(customer.getName(), is("Joe"));

        Map<String, Object> map = jdbcTemplate.queryForMap("select * from principal where email = 'joe@example.com'");
        assertThat(map.get("email"), Matchers.<Object>is("joe@example.com"));
        assertThat(map.get("ptype"), Matchers.<Object>is(5));
        assertThat(map.get("isgroup"), Matchers.<Object>is(0));
        assertThat(map.get("canlogin"), Matchers.<Object>is(0));

        String userId = (String) map.get("uid");
        UserVerificationToken token = userVerificationTokenRepository.findByPrincipalUid(userId);
        assertNotNull(token);

        verify(mailSender).send(any(SimpleMailMessage.class));
    }
}
