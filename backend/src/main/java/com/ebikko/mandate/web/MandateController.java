package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.service.MandateService;
import ebikko.EbikkoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

import static com.ebikko.mandate.web.MandateController.MANDATE_URL;

@RestController
@RequestMapping(MANDATE_URL)
public class MandateController {

    public static final String MANDATE_URL = "/api/mandate";
    private final MandateService service;

    @Autowired
    public MandateController(MandateService service) {
        this.service = service;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity create(@RequestBody Mandate mandate, HttpServletRequest request) throws EbikkoException {
        service.save(mandate);
        return new ResponseEntity(HttpStatus.CREATED);
    }
}
