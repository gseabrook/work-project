package com.ebikko.mandate.web;

import org.hamcrest.Matchers;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;

import java.math.BigDecimal;
import java.util.Map;

import static com.ebikko.mandate.IDs.NodeTypes.EMANDATE_FORM;
import static com.ebikko.mandate.IDs.PropertyIDs.*;
import static com.ebikko.mandate.MandateBuilder.exampleJson;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MandateControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void shouldCreateAnEDDAFormFromAMandate() throws Exception {

        mockMvc.perform(
                post("/api/mandate")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleJson()))
                .andExpect(status().is2xxSuccessful());

        Map<String, Object> values = jdbcTemplate.queryForMap("select * from nodetype_" + EMANDATE_FORM);
        assertThat(values.get(REFERENCE_NUMBER), Matchers.<Object>is("123abc"));
        assertThat(values.get(FREQUENCY), Matchers.<Object>is("Monthly"));
        assertThat(values.get(MAXIMUM_AMOUNT), Matchers.<Object>is(new BigDecimal("123.45")));


    }
}