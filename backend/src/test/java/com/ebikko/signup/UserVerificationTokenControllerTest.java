package com.ebikko.signup;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.web.AbstractEmbeddedDBControllerTest;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.After;
import org.junit.Test;

import static com.ebikko.signup.UserVerificationTokenController.TOKEN_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class UserVerificationTokenControllerTest extends AbstractEmbeddedDBControllerTest {

    @After
    public void tearDown() throws Exception {
        testDataService.resetPrincipals();
    }

    @Test
    public void shouldReturnToken() throws Exception {
        Customer customer = testDataService.createInactiveCustomer("abc-123");

        String contentAsString = mockMvc.perform(
                get(TOKEN_URL + "/abc-123")
        ).andExpect(status().isOk()).andReturn().getResponse().getContentAsString();

        UserVerificationToken userVerificationToken = new ObjectMapper().readValue(contentAsString, UserVerificationToken.class);
        assertThat(userVerificationToken.getEmailAddress(), is(customer.getEmailAddress()));
    }

}