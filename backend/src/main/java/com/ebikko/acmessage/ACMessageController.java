package com.ebikko.acmessage;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.MandateStatus;
import com.ebikko.mandate.service.MandateService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Receives HTTP Posts from FPX with the AC message as form parameters (referred to as the direct message).
 * The @ModelAttribute annotation will bind the form values on to the FpxACMessageDTO, usually we use @RequestBody
 * but as the values are not sent as the body of the HTTP post, we have to handle it differently
 */
@RestController
@RequestMapping(path = ACMessageController.AC_MESSAGE_URL)
public class ACMessageController {

    public static final String AC_MESSAGE_URL = "/acmessage";

    private final MandateService mandateService;

    public ACMessageController(MandateService mandateService) {
        this.mandateService = mandateService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<String> processACMessage(@ModelAttribute FpxACMessageDTO fpxACMessageDTO) {

        Mandate mandate = mandateService.getMandate(Long.valueOf(fpxACMessageDTO.getFpx_sellerExOrderNo()));
        mandate.setStatus(MandateStatus.fromFpxCode(fpxACMessageDTO.getFpx_debitAuthCode()));
        mandate.setFpxTransactionId(fpxACMessageDTO.getFpx_fpxTxnId());
        mandateService.save(mandate);

        return new ResponseEntity<>("OK", HttpStatus.OK);
    }
}
