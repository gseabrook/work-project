package com.ebikko.mandate.web;

import com.ebikko.mandate.model.User;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RequestMapping("/user")
@RestController
public class UserController {

    @RequestMapping(method = GET)
    public Principal user(Authentication user) {
        return (User) user.getPrincipal();
    }

}
