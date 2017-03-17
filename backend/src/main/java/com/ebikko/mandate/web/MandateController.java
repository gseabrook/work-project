package com.ebikko.mandate.web;

import com.ebikko.mandate.model.ErrorResponse;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.service.MandateService;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import ebikko.EbikkoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import static com.ebikko.mandate.web.MandateController.MANDATE_URL;

@RestController
@RequestMapping(MANDATE_URL)
public class MandateController {

    public static final String MANDATE_URL = "/mandate";
    private final MandateService service;

    @Autowired
    public MandateController(MandateService service) {
        this.service = service;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity create(@RequestBody @Validated Mandate mandate, BindingResult bindingResult) throws EbikkoException {

        if (bindingResult.hasErrors()) {
            ErrorResponse errorResponse = new ErrorResponse(bindingResult);
            return new ResponseEntity(errorResponse, HttpStatus.UNPROCESSABLE_ENTITY);
        } else {
            service.save(mandate);
            return new ResponseEntity(HttpStatus.CREATED);
        }
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
