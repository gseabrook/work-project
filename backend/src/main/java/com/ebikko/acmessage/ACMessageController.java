package com.ebikko.acmessage;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.MandateStatusService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = ACMessageController.AC_MESSAGE_URL)
public class ACMessageController {

    public static final String AC_MESSAGE_URL = "/acmessage";

    private final MandateService mandateService;
    private final MandateStatusService mandateStatusService;

    public ACMessageController(MandateService mandateService, MandateStatusService mandateStatusService) {
        this.mandateService = mandateService;
        this.mandateStatusService = mandateStatusService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<String> processACMessage(@ModelAttribute FpxACMessageDTO fpxACMessageDTO) {

        Mandate mandate = mandateService.getMandate(Long.valueOf(fpxACMessageDTO.getFpx_sellerExOrderNo()));
        mandate.setStatus(mandateStatusService.getMandateStatus(fpxACMessageDTO.getFpx_debitAuthCode()));
        mandateService.save(mandate);

        return new ResponseEntity<>("OK", HttpStatus.OK);
    }
}
