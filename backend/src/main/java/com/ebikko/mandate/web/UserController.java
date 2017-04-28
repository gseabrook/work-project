package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.PrincipalService;
import com.ebikko.mandate.service.UserService;
import com.ebikko.signup.UserVerificationTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;

import static com.ebikko.mandate.web.UserController.USER_URL;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RequestMapping(USER_URL)
@RestController
public class UserController {

    public static final String USER_URL = "/user";
    private final PrincipalService principalService;
    private final UserService userService;
    private final MandateService mandateService;
    private final ApplicationEventPublisher applicationEventPublisher;
    private final UserVerificationTokenService userVerificationTokenService;

    @Autowired
    public UserController(PrincipalService principalService, UserService userService, MandateService mandateService,
                          ApplicationEventPublisher applicationEventPublisher, UserVerificationTokenService userVerificationTokenService) {
        this.principalService = principalService;
        this.userService = userService;
        this.mandateService = mandateService;
        this.applicationEventPublisher = applicationEventPublisher;
        this.userVerificationTokenService = userVerificationTokenService;
    }

    @RequestMapping(method = GET)
    public Principal user(Authentication user) {
        return (User) user.getPrincipal();
    }

    @RequestMapping(method = GET, path = "/mandate")
    public ResponseEntity getMandates(Authentication auth) {
        List<Mandate> mandates = mandateService.getMandates((User) auth.getPrincipal());
        return new ResponseEntity(mandates, HttpStatus.OK);
    }

}
