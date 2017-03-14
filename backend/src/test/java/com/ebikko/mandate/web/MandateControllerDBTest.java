package com.ebikko.mandate.web;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class MandateControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void shouldCreateAnEDDAFormFromAMandate() throws Exception {

//        mockMvc.perform(
//                post("/api/mandate")
//                        .contentType(MediaType.APPLICATION_JSON)
//                        .content(exampleJson()))
//                .andExpect(status().is2xxSuccessful());
//
//        Map<String, Object> values = jdbcTemplate.queryForMap("select * from nodetype_bfcf13dec59e4179bbc8168111d8980a");
//        assertThat(values.get("bd3fe6ad0f694c88b811e295cd80c2db"), Matchers.<Object>is("123abc"));
//        assertThat(values.get("h5d3080119084691906659f8204575b5"), Matchers.<Object>is("Monthly"));
//        assertThat(values.get("h45ca6122be44564880af16c63d4b03a"), Matchers.<Object>is(new BigDecimal("123.45")));
    }
}