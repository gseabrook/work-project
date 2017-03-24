package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.MerchantService;
import com.ebikko.mandate.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;
import org.mockito.Mock;

import java.util.List;

import static com.ebikko.mandate.builder.MandateBuilder.exampleMandate;
import static com.ebikko.mandate.builder.MerchantBuilder.exampleMerchant;
import static com.ebikko.mandate.web.MerchantController.MERCHANT_MANDATE_URL;
import static com.ebikko.mandate.web.MerchantController.MERCHANT_URL;
import static com.google.common.collect.Lists.newArrayList;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasSize;
import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


public class MerchantControllerTest extends AbstractControllerTest {

    @Mock
    private MerchantService merchantService;
    @Mock
    private UserService userService;
    @Mock
    private MandateService mandateService;

    @Override
    public Object getController() {
        return new MerchantController(merchantService, userService, mandateService);
    }

    @Test
    public void shouldLoadMerchantInformation() throws Exception {

        String merchantId = "123";

        Merchant exampleMerchant = exampleMerchant();
        given(merchantService.getMerchant(merchantId)).willReturn(exampleMerchant);

        String response = mockMvc
                .perform(get(MERCHANT_URL + "/" + merchantId))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        Merchant merchant = new ObjectMapper().readValue(response, Merchant.class);

        assertThat(merchant, equalTo(exampleMerchant));
    }

    @Test
    public void shouldLoadMandateInformation() throws Exception {
        String merchantId = "123";

        Merchant exampleMerchant = exampleMerchant();
        given(merchantService.getMerchant(merchantId)).willReturn(exampleMerchant);

        Mandate exampleMandate = exampleMandate();
        given(merchantService.getMandates(exampleMerchant)).willReturn(newArrayList(exampleMandate));

        String response = mockMvc
                .perform(get(MERCHANT_URL + "/" + merchantId + MERCHANT_MANDATE_URL))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        ObjectMapper objectMapper = new ObjectMapper();
        List<Mandate> mandates = objectMapper.readValue(response, List.class);

        assertThat(mandates, hasSize(1));
    }
}