package com.ebikko.banks;

import com.ebikko.mandate.model.Bank;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

import static org.hibernate.validator.internal.util.CollectionHelper.newArrayList;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RequestMapping(BankController.BANK_URL)
@RestController
public class BankController {

    public static final String BANK_URL = "/bank";

    private final BankService bankService;
    private final RestTemplate restTemplate;

    public BankController(BankService bankService, RestTemplate restTemplate) {
        this.bankService = bankService;
        this.restTemplate = restTemplate;
    }

    @RequestMapping(method = GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Bank>> getBanks() {

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<Map> entity = new HttpEntity<>(new FpxBEMessageDTO().getMap(), headers);

        ResponseEntity<String> bcMessage = restTemplate.exchange("http://www.test.com", HttpMethod.POST, entity, String.class);
        FpxBCMessageDTO bcMessageDTO = new FpxBCMessageDTO(bcMessage.getBody());
        Iterable<Bank> banks = bankService.getBanks();
        List<Bank> filteredBanks = newArrayList();

        for (Bank bank : banks) {
            if (dtoContainsBank(bank, bcMessageDTO.getFpx_bankList())) {
                filteredBanks.add(bank);
            }
        }

        return new ResponseEntity<>(filteredBanks, HttpStatus.OK);
    }

    private boolean dtoContainsBank(Bank bank, List<BEMessageBank> dtoBanks) {
        for (BEMessageBank beMessageBank : dtoBanks) {
            if (beMessageBank.getBankId().equals(bank.getCode()) && beMessageBank.getBankStatus().equals("A")) {
                return true;
            }
        }

        return false;
    }
}
