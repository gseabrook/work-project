package com.ebikko.signup;

import com.ebikko.SessionAction;
import com.ebikko.mandate.IDs;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.web.AbstractEmbeddedDBControllerTest;
import com.fasterxml.jackson.databind.ObjectMapper;
import ebikko.EbikkoException;
import ebikko.Principal;
import ebikko.Session;
import org.hamcrest.Matchers;
import org.junit.After;
import org.junit.Test;
import org.springframework.http.MediaType;

import java.util.Map;

import static com.ebikko.mandate.responsematcher.ValidationErrorResponseMatchers.response;
import static com.ebikko.signup.SignUpController.SIGNUP_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class SignUpControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @After
    public void tearDown() throws Exception {
        testDataService.resetPrincipals();
    }

    @Test
    public void shouldAllowInactiveInvitedUsersToRegister() throws Exception {
        Customer customer = testDataService.createInactiveCustomer();

        SignUpDTO signUpDTO = new SignUpDTO(customer.getEmailAddress(), "abc123", "abc123", "");

        mockMvc.perform(
                post(SIGNUP_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(signUpDTO)))
                .andExpect(status().isCreated());

        Map<String, Object> map = jdbcTemplate.queryForMap("select * from principal where email = '" + signUpDTO.getEmail() + "'");
        assertThat(map.get("email"), Matchers.<Object>is(signUpDTO.getEmail()));
        assertThat(map.get("username"), Matchers.<Object>is(signUpDTO.getEmail()));
        assertThat(map.get("name"), Matchers.<Object>is(customer.getName()));
        assertThat(map.get("ptype"), Matchers.<Object>is(5));
        assertThat(map.get("isgroup"), Matchers.<Object>is(0));
        assertThat(map.get("canlogin"), Matchers.<Object>is(0));
        assertThat(map.get("password"), Matchers.is(Matchers.notNullValue()));
        assertThat(map.get(IDs.PropertyIDs.CUSTOMER_ID), Matchers.<Object>is(customer.getId().toString()));

        String userId = (String) map.get("uid");
        UserVerificationToken userVerificationToken = userVerificationTokenRepository.findByPrincipalUid(userId);
        assertNotNull(userVerificationToken);
    }

    @Test
    public void shouldCreatePrincipalAndCustomer() throws Exception {
        testDataService.resetPrincipals();
        String emailAddress = "test2@example.com";
        SignUpDTO signUpDTO = new SignUpDTO(emailAddress, "abc123", "abc123", "");

        mockMvc.perform(
                post(SIGNUP_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(signUpDTO)))
                .andExpect(status().isCreated());

        Map<String, Object> map = jdbcTemplate.queryForMap("select * from principal where email = 'test2@example.com'");
        assertThat(map.get("email"), Matchers.<Object>is(signUpDTO.getEmail()));
        assertThat(map.get("ptype"), Matchers.<Object>is(5));
        assertThat(map.get("isgroup"), Matchers.<Object>is(0));
        assertThat(map.get("canlogin"), Matchers.<Object>is(0));

        String userId = (String) map.get("uid");
        UserVerificationToken userVerificationToken = userVerificationTokenRepository.findByPrincipalUid(userId);
        assertNotNull(userVerificationToken);

        Customer customer = customerRepository.findByEmailAddress(emailAddress);
        assertNotNull(customer);
    }

    @Test
    public void shouldActivateAUserWithTheirPasswordAndToken() throws Exception {
        Customer customer = testDataService.createInactiveCustomer("ABCDEFG1234");

        SignUpDTO signUpDTO = new SignUpDTO(customer.getEmailAddress(), "password", "password", "ABCDEFG1234");

        mockMvc.perform(
                post(SIGNUP_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(signUpDTO)))
                .andExpect(status().isOk());

        sessionService.performSessionAction(new SessionAction<Void>() {
            @Override
            public Void perform(Session session) throws EbikkoException {
                session.clearPrincipalCache();
                Principal principal = session.getPrincipal("aaa111");
                assertTrue(principal.isCanLogin());
                return null;
            }
        });
    }

    @Test
    public void shouldRejectUsersWithoutMatchingPasswords() throws Exception {
        SignUpDTO signUpDTO = new SignUpDTO("test@example.com", "abc1", "abc2", "");

        mockMvc.perform(
                post(SIGNUP_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(signUpDTO)))
                .andExpect(status().isUnprocessableEntity())
                .andExpect(response().hasErrorForField("signUpDTO", "Passwords do not match"));
    }

    @Test
    public void shouldRejectUsersWithoutEmail() throws Exception {
        SignUpDTO signUpDTO = new SignUpDTO("", "abc1", "abc2", "");

        mockMvc.perform(
                post(SIGNUP_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(signUpDTO)))
                .andExpect(status().isUnprocessableEntity())
                .andExpect(response().hasErrorForField("email", "Please enter an email address"));
    }

    @Test
    public void shouldRejectUsersWithDuplicateEmail() throws Exception {
        Customer customer = testDataService.createActiveCustomer();
        SignUpDTO signUpDTO = new SignUpDTO(customer.getEmailAddress(), "abc1", "abc1", "");

        mockMvc.perform(
                post(SIGNUP_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(new ObjectMapper().writeValueAsString(signUpDTO)))
                .andExpect(status().isUnprocessableEntity())
                .andExpect(response().hasErrorForField("signUpDTO", "Email address is already in use"));

        testDataService.resetPrincipals();
    }
}