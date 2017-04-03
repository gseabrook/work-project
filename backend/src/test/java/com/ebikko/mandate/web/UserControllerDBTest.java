package com.ebikko.mandate.web;

import com.ebikko.mandate.IDs;
import com.ebikko.mandate.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hamcrest.Matchers;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import java.util.List;
import java.util.Map;

import static com.ebikko.mandate.web.UserController.USER_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.authentication;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class UserControllerDBTest extends AbstractEmbeddedDBControllerTest{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void shouldCreateAPrincipalAssociatedWithCustomer() throws Exception {

        Customer customer = testDataService.createCustomer();
        SignUpDTO signUpDTO = new SignUpDTO(customer.getEmailAddress(), "abc123");

        mockMvc.perform(
                post(USER_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(signUpDTO)))
                .andExpect(status().isCreated());

        Map<String, Object> map = jdbcTemplate.queryForMap("select * from principal where email = '" + signUpDTO.getEmail() + "'");
        assertThat(map.get("email"), Matchers.<Object>is(signUpDTO.getEmail()));
        assertThat(map.get("username"), Matchers.<Object>is(signUpDTO.getEmail()));
        assertThat(map.get("name"), Matchers.<Object>is(customer.getName()));
        assertThat(map.get("ptype"), Matchers.<Object>is(5));
        assertThat(map.get("isgroup"), Matchers.<Object>is(0));
        assertThat(map.get("canlogin"), Matchers.<Object>is(1));
        assertThat(map.get(IDs.PropertyIDs.CUSTOMER_ID), Matchers.<Object>is(customer.getId().toString()));
    }

    @Test
    public void shouldGetMandatesForAMerchant() throws Exception {
        // 2 Merchants in the system, each with a mandate
        Merchant merchant = testDataService.createMerchant();
        testDataService.createMandate(merchant);
        testDataService.createMandate();

        User user = new User("123", merchant.getId().toString(), "testuser", "John", User.UserType.MERCHANT);
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

        User user = new User("123", customer.getId().toString(), "testuser", "John", User.UserType.CUSTOMER);
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