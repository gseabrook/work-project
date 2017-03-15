package com.ebikko.mandate.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/heartbeat")
public class HeartbeatController {

    @RequestMapping(method = RequestMethod.GET)
    public String heartbeat() {
        return "OK";
    }
}
