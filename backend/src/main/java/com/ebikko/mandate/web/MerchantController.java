package com.ebikko.mandate.web;

import com.ebikko.mandate.model.*;
import com.ebikko.mandate.model.event.MandateUpdatedEvent;
import com.ebikko.mandate.service.CustomerService;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.MerchantService;
import com.ebikko.mandate.service.UserService;
import com.ebikko.mandate.service.translator.MandateDTOTranslator;
import com.ebikko.mandate.web.dto.MandateDTO;
import ebikko.EbikkoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ebikko.mandate.web.MerchantController.MERCHANT_URL;
import static org.springframework.http.HttpStatus.OK;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RestController
@RequestMapping(MERCHANT_URL)
public class MerchantController {

    public static final String MERCHANT_URL = "/merchant";
    public static final String MERCHANT_MANDATE_URL = "/mandate";

    private final MerchantService merchantService;
    private final UserService userService;
    private final MandateService mandateService;
    private final MandateDTOTranslator mandateDTOTranslator;
    private final CustomerService customerService;
    private final ApplicationEventPublisher applicationEventPublisher;

    @Autowired
    public MerchantController(MerchantService merchantService, UserService userService, MandateService mandateService,
                              MandateDTOTranslator mandateDTOTranslator, CustomerService customerService,
                              ApplicationEventPublisher applicationEventPublisher) {
        this.merchantService = merchantService;
        this.userService = userService;
        this.mandateService = mandateService;
        this.mandateDTOTranslator = mandateDTOTranslator;
        this.customerService = customerService;
        this.applicationEventPublisher = applicationEventPublisher;
    }

    @RequestMapping(path = "/{merchantId}", method = GET, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity getMerchant(@PathVariable("merchantId") String merchantId) throws EbikkoException {
        Merchant merchant = merchantService.getMerchant(merchantId);

        return new ResponseEntity(merchant, OK);
    }

    @RequestMapping(path = "/{merchantId}" + MERCHANT_MANDATE_URL, method = GET, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity getMandatesForMerchant(@PathVariable("merchantId") String merchantId) throws EbikkoException {
        Merchant merchant = merchantService.getMerchant(merchantId);

        List<Mandate> mandates = mandateService.getMandates(merchant);

        return new ResponseEntity(mandates, OK);
    }

    @RequestMapping(path = MERCHANT_MANDATE_URL, method = GET, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity getMandatesForLoggedInMerchant(Authentication auth) throws EbikkoException {
        Merchant merchant = userService.getMerchant((User) auth.getPrincipal());

        List<Mandate> mandates = mandateService.getMandates(merchant);

        return new ResponseEntity(mandates, OK);
    }

    @RequestMapping(path = MERCHANT_MANDATE_URL, method = RequestMethod.POST)
    public ResponseEntity create(@RequestBody @Validated MandateDTO mandateDTO, BindingResult bindingResult,
                                 Authentication auth) throws EbikkoException {

        if (bindingResult.hasErrors()) {
            ErrorResponse errorResponse = new ErrorResponse(bindingResult);
            return new ResponseEntity(errorResponse, HttpStatus.UNPROCESSABLE_ENTITY);
        } else {
            Mandate mandate = mandateDTOTranslator.translate(mandateDTO);
            Merchant merchant = userService.getMerchant((User) auth.getPrincipal());
            mandate.setMerchant(merchant);
            merchant.addMandate(mandate);
            mandateService.save(mandate);
            applicationEventPublisher.publishEvent(new MandateUpdatedEvent(mandate));
            return new ResponseEntity(new FpxADMessageDTO(mandate), HttpStatus.CREATED);
        }
    }
}
