package com.ebikko.mandate.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.MockRestServiceServer;

import java.util.List;
import java.util.Map;

import static com.ebikko.banks.BankController.BANK_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class BankControllerDBTest extends AbstractEmbeddedDBControllerTest {

    private MockRestServiceServer mockServer;

    @Before
    public void setUp() {
        mockServer = MockRestServiceServer.createServer(restTemplate);
    }

    @Ignore("Enabled once posting to FPX has been enabled and the bank controller implemented fully")
    @Test
    public void shouldReturnAllBanks() throws Exception {
        mockServer.expect(requestTo("http://www.test.com"))
                .andExpect(method(HttpMethod.POST))
                .andRespond(withSuccess(exampleBCMessage(), MediaType.TEXT_PLAIN));

        String contentAsString = mockMvc.perform(get(BANK_URL).with(user("bob")))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        mockServer.verify();

        List<Map> banks = new ObjectMapper().readValue(contentAsString, List.class);
        assertThat(banks, Matchers.hasSize(5));
    }

    private String exampleBCMessage() {
        return "fpx_msgType=BC,fpx_msgToken=01,fpx_sellerExId=EX00002460,fpx_bankList=MBB0228~A,PBB0233~B,MB2U0227~A,BIMB0340~A,RHB0218~A,HLB0224~A,fpx_checkSum=2A2AAAF509334AB80326CEDBB43B355A560581DDC593F5D8C21BB0AE807B2E64661825FCCF06AA7A9E96A33FEB9FBAF3CF0E879BA4160A7E11DDD42890C3907DF94C2BD524EC367A326A3CF9ABABC3D5412667D9D8761C1F5E2DA432176FC9DA5353717601ED9889B0897ABBBF854ECD89A669AA65FABDA4FA1BF0F3E034B55C08D5A942DDC0FF40AFF277DC9AAF5EBE2F387A92C8D5BEEB8B446296C88F2ABF03519B9F0B6A669FE0B15CEFDB739E435121DB0D79F1B4930D040F8C86D23043FCD577E3B2D21412DE9ED8864346A2ECEC4659EFE68E2095DF71F98338755846F7760C34B2E3ACB3321911165C8385B4F3FB729C929611AC194167FEF2B77FF1";
    }
}