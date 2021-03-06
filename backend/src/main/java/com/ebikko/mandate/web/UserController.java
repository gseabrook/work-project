package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.service.MandateService;
import com.google.common.base.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.ebikko.mandate.web.UserController.USER_URL;
import static com.google.common.collect.Collections2.filter;
import static com.google.common.collect.Lists.newArrayList;
import static org.apache.commons.lang.StringUtils.isBlank;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RequestMapping(USER_URL)
@RestController
public class UserController {

    public static final String USER_URL = "/user";
    private final MandateService mandateService;

    @Autowired
    public UserController(MandateService mandateService) {
        this.mandateService = mandateService;
    }

    @RequestMapping(method = GET)
    public ResponseEntity user(Authentication user) {
        if (user == null) {
            return new ResponseEntity(HttpStatus.UNAUTHORIZED);
        } else {
            return new ResponseEntity(user.getPrincipal(), HttpStatus.OK);
        }
    }

    @RequestMapping(method = GET, path = "/mandate")
    public ResponseEntity getMandates(Authentication auth) {
        User principal = (User) auth.getPrincipal();
        List<Mandate> mandates = mandateService.getMandates(principal);
        if (principal.isCustomer()) {
            mandates = newArrayList(filter(mandates, new Predicate<Mandate>() {
                public boolean apply(Mandate input) {
                    return !isBlank(input.getReferenceNumber());
                }
            }));
        }

        return new ResponseEntity(mandates, HttpStatus.OK);
    }

}
