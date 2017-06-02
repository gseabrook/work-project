package com.ebikko.mandate.model;

import org.junit.Test;

import static com.ebikko.mandate.builder.MandateBuilder.exampleMandate;
import static com.ebikko.mandate.model.MandateStatus.AWAITING_FPX_TERMINATION;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.hamcrest.core.StringStartsWith.startsWith;

public class FpxADMessageDTOTest {

    @Test
    public void shouldTranslateMandateToFpxADMessageDTO() throws Exception {
        Mandate mandate = exampleMandate();

        FpxADMessageDTO adMessageDTO = new FpxADMessageDTO(mandate);

        assertThat(adMessageDTO.getFpx_buyerIBan(), startsWith("02"));
    }

    @Test
    public void shouldUseTheCorrectApplicationTypeForTermination() throws Exception {
        Mandate mandate = exampleMandate();
        mandate.setStatus(AWAITING_FPX_TERMINATION);

        FpxADMessageDTO adMessageDTO = new FpxADMessageDTO(mandate);

        assertThat(adMessageDTO.getFpx_buyerIBan(), startsWith("03"));
    }

    @Test
    public void shouldCombineIDValuesIntoBuyerID() throws Exception {
        Mandate mandate = exampleMandate();

        FpxADMessageDTO adMessageDTO = new FpxADMessageDTO(mandate);

        assertThat(adMessageDTO.getFpx_buyerId(), is("54321234,3"));
    }

    @Test
    public void shouldSupportNullRegistrationDates() throws Exception {
        Mandate mandate = exampleMandate();
        mandate.setRegistrationDate(null);

        new FpxADMessageDTO(mandate);
    }
}