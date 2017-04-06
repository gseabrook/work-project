package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.After;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import java.util.List;

import static com.ebikko.mandate.web.UserController.USER_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.authentication;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class UserControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @After
    public void tearDown() throws Exception {
        jdbcTemplate.execute("delete from principal where uid != '00000000000000000000000000000000'");
    }

    @Test
    public void shouldGetMandatesForAMerchant() throws Exception {
        // 2 Merchants in the system, each with a mandate
        Merchant merchant = testDataService.createMerchant();
        testDataService.createMandate(merchant);
        testDataService.createMandate();

        User user = new User("123", merchant.getId().toString(), "testuser", "John", User.UserType.MERCHANT, "john@test.com");
        super.setAuthenticationPrincipal(user);

        String contentAsString = mockMvc.perform(
                get(USER_URL + "/mandate").contentType(MediaType.APPLICATION_JSON)
                .with(authentication(new UsernamePasswordAuthenticationToken(user, ""))))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        List list = new ObjectMapper().readValue(contentAsString, List.class);

        assertThat(list.size(), is(1));
    }

    @Test
    public void shouldGetMandatesForACustomer() throws Exception {
        Customer customer = testDataService.createCustomer();
        testDataService.createMandate(customer);
        testDataService.createMandate();

        User user = new User("123", customer.getId().toString(), "testuser", "John", User.UserType.CUSTOMER, "john@test.com");
        super.setAuthenticationPrincipal(user);

        String contentAsString = mockMvc.perform(
                get(USER_URL + "/mandate").contentType(MediaType.APPLICATION_JSON)
                        .with(authentication(new UsernamePasswordAuthenticationToken(user, ""))))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        List list = new ObjectMapper().readValue(contentAsString, List.class);

        assertThat(list.size(), is(1));
    }
}