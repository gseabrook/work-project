package com.ebikko.acmessage;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.web.AbstractEmbeddedDBControllerTest;
import org.junit.Test;
import org.springframework.http.MediaType;

import static com.ebikko.acmessage.ACMessageController.AC_MESSAGE_URL;
import static com.ebikko.mandate.model.MandateStatus.APPROVED;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class ACMessageControllerTest extends AbstractEmbeddedDBControllerTest {

    @Test
    public void shouldProcessValidACMessage() throws Exception {

        Mandate pendingMandate = testDataService.createPendingMandate();

        mockMvc.perform(post(AC_MESSAGE_URL)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .param("fpx_msgType","AC")
                .param("fpx_msgToken","01")
                .param("fpx_fpxTxnId","1610181200130689")
                .param("fpx_sellerExId","EX00002460")
                .param("fpx_sellerExOrderNo",pendingMandate.getId().toString())
                .param("fpx_fpxTxnTime","20161018115351")
                .param("fpx_sellerTxnTime","20161018120215")
                .param("fpx_sellerOrderNo","5408327679348321178")
                .param("fpx_sellerId","SE00006921")
                .param("fpx_txnCurrency","MYR")
                .param("fpx_txnAmount","1.00")
                .param("fpx_checkSum","22B141C646CDD15C5B5AD647A274C106FF80FBDFE727F8000D456EB269355526D7B13F2AF1E2BB8A38530860C7D977706606CCE6324898B52B697266E7B50B2541788194BC52B8FC04E6C36B937F82DC06AF64BD99D3594496468538E92CB979E216929326B331B93B12222F226EF0C15482E50C1A5F9E72CF370DDADD43831AC5B7384FC97F66C97A9F04E75BB80642752E4CEB32DF3F5429809CA9DD9810FF4DC495CF0CCFD09BAA11EE689B6DB5AB3071EF57D2A30F4CFD0CF0AB38910AD97EC9B1B6B9A29113E58822B3FAF978670ED2A0B9DF37AC995FFDD9533893167D8AD5A96C456A8E324F9BCE5A8BBB5483D01AB6EBBB02E189C31E5CA0093CEF6D")
                .param("fpx_buyerName","Buyer Name")
                .param("fpx_buyerBankId","TEST0021")
                .param("fpx_buyerBankBranch","SBI BANK A")
                .param("fpx_buyerId","Buyer1234")
                .param("fpx_makerName","Maker Name")
                .param("fpx_buyerIban","")
                .param("fpx_debitAuthCode","00")
                .param("fpx_debitAuthNo","15733223")
                .param("fpx_creditAuthCode","00")
                .param("fpx_creditAuthNo","10096415")
        )
                .andExpect(status().isOk())
                .andExpect(content().string("OK"));

        Mandate savedMandate = mandateRepository.findOne(pendingMandate.getId());

        assertThat(savedMandate.getStatus(), is(APPROVED));
        assertThat(savedMandate.getFpxTransactionId(), is("1610181200130689"));
    }
}