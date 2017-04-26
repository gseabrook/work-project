package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Mandate;
import org.junit.Test;

import static com.ebikko.mandate.web.MandateController.MANDATE_URL;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MandateControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Test
    public void shouldLoadMandateByUid() throws Exception {
        Mandate mandate = testDataService.createMandate();

        String contentAsString = mockMvc
                .perform(get(MANDATE_URL + "/" + mandate.getId()))
                .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
    }
}