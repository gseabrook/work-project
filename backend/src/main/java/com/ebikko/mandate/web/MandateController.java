package com.ebikko.mandate.web;

import com.ebikko.mandate.model.ErrorResponse;
import com.ebikko.mandate.model.IDType;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.MandateFrequency;
import com.ebikko.mandate.model.event.MandateUpdatedEvent;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.translator.MandateDTOTranslator;
import com.ebikko.mandate.web.dto.MandateDTO;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import ebikko.EbikkoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ebikko.mandate.web.MandateController.MANDATE_URL;
import static com.google.common.collect.Lists.newArrayList;
import static org.springframework.http.HttpStatus.*;

@RestController
@RequestMapping(MANDATE_URL)
public class MandateController {

    public static final String MANDATE_URL = "/mandate";
    private final MandateService service;
    private final MandateDTOTranslator mandateDTOTranslator;
    private final ApplicationEventPublisher applicationEventPublisher;

    @Autowired
    public MandateController(MandateService service, MandateDTOTranslator mandateDTOTranslator, ApplicationEventPublisher applicationEventPublisher) {
        this.service = service;
        this.mandateDTOTranslator = mandateDTOTranslator;
        this.applicationEventPublisher = applicationEventPublisher;
    }

    @RequestMapping(method = RequestMethod.GET, path = "/{mandateId}")
    public ResponseEntity get(@PathVariable Long mandateId) throws EbikkoException {
        Mandate mandate = service.getMandate(mandateId);

        if (mandate == null) {
            return new ResponseEntity(NOT_FOUND);
        } else {
            return new ResponseEntity(mandate, OK);
        }
    }

    @RequestMapping(method = RequestMethod.GET, path = "/frequency")
    public List<MandateFrequency> getFrequencies() {
        return newArrayList(MandateFrequency.values());
    }

    @RequestMapping(method = RequestMethod.GET, path = "/idType")
    public List<IDType> getIdTypes() {
        return newArrayList(IDType.values());
    }

    @RequestMapping(method = RequestMethod.PUT, path = "/{mandateId}")
    public ResponseEntity update(@PathVariable Long mandateId, @RequestBody MandateDTO mandateDTO) throws EbikkoException {
        if (!mandateId.equals(Long.valueOf(mandateDTO.getId()))) {
            throw new EbikkoException("IDs do not match");
        }

        if (mandateDTO.getId() == null) {
            throw new EbikkoException("Mandate ID cannot be null");
        }

        Mandate mandate = mandateDTOTranslator.translate(mandateDTO);
        Mandate savedMandate = service.getMandate(mandateId);
        mandate.setMerchant(savedMandate.getMerchant());

        service.save(mandate);
        applicationEventPublisher.publishEvent(new MandateUpdatedEvent(mandate));

        return new ResponseEntity(NO_CONTENT);
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity handleException(HttpMessageNotReadableException e) {
        if (e.getCause() instanceof InvalidFormatException) {
            ErrorResponse errorResponse = new ErrorResponse((InvalidFormatException) e.getCause());
            return new ResponseEntity(errorResponse, HttpStatus.BAD_REQUEST);
        }
        return null;
    }
}
