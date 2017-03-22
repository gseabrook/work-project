package com.ebikko.mandate.web;

import com.ebikko.SessionService;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.translator.NodeTranslator;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

import static com.ebikko.mandate.builder.MandateBuilder.exampleMandate;
import static com.ebikko.mandate.web.MerchantController.MERCHANT_MANDATE_URL;
import static com.ebikko.mandate.web.MerchantController.MERCHANT_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MerchantControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Autowired
    private SessionService sessionService;
    @Autowired
    private NodeTranslator nodeTranslator;
    @Autowired
    private MandateService mandateService;
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void shouldRetrieveMerchantInformation() throws Exception {
        String contentAsString = mockMvc
                .perform(get(MERCHANT_URL + "/c22816ad803c47ed83400bc787d06ed4-cf4ad5cb478c4c36a3dec97e16d81091"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        Merchant response = new ObjectMapper().readValue(contentAsString, Merchant.class);

        assertThat(response.getCompanyRegistrationNumber(), is("WP010101334"));
        assertThat(response.getCompanyName(), is("Ag I Solutions"));
    }

    @Test
    public void shouldRetrieveMandatesForMerchant() throws Exception {
        final Mandate mandate = exampleMandate();
        mandateService.save(mandate);

        String contentAsString = mockMvc
                .perform(get(MERCHANT_URL + "/c22816ad803c47ed83400bc787d06ed4-cf4ad5cb478c4c36a3dec97e16d81091" + MERCHANT_MANDATE_URL))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        List list = new ObjectMapper().readValue(contentAsString, List.class);

        assertThat(list.size(),greaterThan(0));
    }
}
