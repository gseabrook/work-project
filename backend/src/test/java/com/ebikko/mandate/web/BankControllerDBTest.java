package com.ebikko.mandate.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.hamcrest.Matchers;
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ebikko.mandate.web.BankController.BANK_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class BankControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Test
    public void shouldReturnAllBanks() throws Exception {

        String contentAsString = mockMvc.perform(get(BANK_URL).with(user("bob")))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        List<Map> banks = new ObjectMapper().readValue(contentAsString, List.class);
        assertThat(banks, Matchers.hasSize(16));
    }
}