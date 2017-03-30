package com.ebikko.mandate.web;

import com.ebikko.mandate.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RequestMapping("/user")
@RestController
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(method = GET)
    public Principal user(Authentication user) {
        return userService.convertPrincipal((ebikko.Principal) user.getPrincipal());
    }

}
