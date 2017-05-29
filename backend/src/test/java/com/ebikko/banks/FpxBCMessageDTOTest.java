package com.ebikko.banks;

import org.junit.Test;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.hamcrest.core.Is.is;
import static org.hamcrest.core.StringStartsWith.startsWith;

public class FpxBCMessageDTOTest {

    @Test
    public void shouldParseBCMessageResponse() throws Exception {
        String response = "fpx_msgType=BC,fpx_msgToken=01,fpx_sellerExId=EX00002460,fpx_bankList=MBB0227~A,PBB0233~B,MB2U0227~A,BIMB0340~A,RHB0218~A,HLB0224~A,fpx_checkSum=2A2AAAF509334AB80326CEDBB43B355A560581DDC593F5D8C21BB0AE807B2E64661825FCCF06AA7A9E96A33FEB9FBAF3CF0E879BA4160A7E11DDD42890C3907DF94C2BD524EC367A326A3CF9ABABC3D5412667D9D8761C1F5E2DA432176FC9DA5353717601ED9889B0897ABBBF854ECD89A669AA65FABDA4FA1BF0F3E034B55C08D5A942DDC0FF40AFF277DC9AAF5EBE2F387A92C8D5BEEB8B446296C88F2ABF03519B9F0B6A669FE0B15CEFDB739E435121DB0D79F1B4930D040F8C86D23043FCD577E3B2D21412DE9ED8864346A2ECEC4659EFE68E2095DF71F98338755846F7760C34B2E3ACB3321911165C8385B4F3FB729C929611AC194167FEF2B77FF1";

        FpxBCMessageDTO bcMessageDTO = new FpxBCMessageDTO(response);

        assertThat(bcMessageDTO.getFpx_msgType(), is("BC"));
        assertThat(bcMessageDTO.getFpx_msgToken(), is("01"));
        assertThat(bcMessageDTO.getFpx_sellerExId(), is("EX00002460"));
        assertThat(bcMessageDTO.getFpx_checkSum(), startsWith("2A2AAAF509334A"));

        List<BEMessageBank> bankList = bcMessageDTO.getFpx_bankList();
        assertThat(bankList, hasSize(6));

        BEMessageBank beMessageBank = bankList.get(0);
        assertThat(beMessageBank.getBankId(), is("MBB0227"));
        assertThat(beMessageBank.getBankStatus(), is("A"));
    }
}