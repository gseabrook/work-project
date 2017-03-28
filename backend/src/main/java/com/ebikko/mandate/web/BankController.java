package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.service.BankService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RequestMapping(BankController.BANK_URL)
@RestController
public class BankController {

    public static final String BANK_URL = "/bank";

    private final BankService bankService;

    public BankController(BankService bankService) {
        this.bankService = bankService;
    }

    @RequestMapping(method = GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Iterable<Bank>> getBanks() {
        return new ResponseEntity<>(bankService.getBanks(), HttpStatus.OK);
    }
}
