package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.service.MerchantService;
import ebikko.EbikkoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.ebikko.mandate.web.MerchantController.MERCHANT_URL;
import static org.springframework.http.HttpStatus.OK;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RestController
@RequestMapping(MERCHANT_URL + "/{merchantId}")
public class MerchantController {

    public static final String MERCHANT_URL = "/merchant";
    public static final String MERCHANT_MANDATE_URL = "/mandate";
    private final MerchantService merchantService;

    @Autowired
    public MerchantController(MerchantService merchantService) {
        this.merchantService = merchantService;
    }

    @RequestMapping(method = GET, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity getMerchant(@PathVariable("merchantId") String merchantId) throws EbikkoException {
        Merchant merchant = merchantService.getMerchant(merchantId);

        return new ResponseEntity(merchant, OK);
    }

    @RequestMapping(path = MERCHANT_MANDATE_URL, method = GET, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity getMandatesForMerchant(@PathVariable("merchantId") String merchantId) throws EbikkoException {
        Merchant merchant = merchantService.getMerchant(merchantId);

        List<Mandate> mandates = merchantService.getMandates(merchant);

        return new ResponseEntity(mandates, OK);
    }

}
