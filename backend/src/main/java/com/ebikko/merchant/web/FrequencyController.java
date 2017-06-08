package com.ebikko.merchant.web;

import com.ebikko.mandate.model.MandateFrequency;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

import static com.google.common.collect.Lists.newArrayList;
import static org.springframework.http.ResponseEntity.ok;

@RestController
@RequestMapping("/frequency")
public class FrequencyController {

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<ArrayList<MandateFrequency>> getFrequencies() {
        return ok(newArrayList(MandateFrequency.values()));
    }
}
