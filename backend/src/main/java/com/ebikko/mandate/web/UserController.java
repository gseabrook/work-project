package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.SignUpDTO;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.PrincipalService;
import com.ebikko.mandate.service.UserService;
import ebikko.EbikkoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import static com.ebikko.mandate.web.UserController.USER_URL;
import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@RequestMapping(USER_URL)
@RestController
public class UserController {

    public static final String USER_URL = "/user";
    private final PrincipalService principalService;
    private final UserService userService;
    private final MandateService mandateService;

    @Autowired
    public UserController(PrincipalService principalService, UserService userService, MandateService mandateService) {
        this.principalService = principalService;
        this.userService = userService;
        this.mandateService = mandateService;
    }

    @RequestMapping(method = GET)
    public Principal user(Authentication user) {
        return (User) user.getPrincipal();
    }

    @RequestMapping(method = POST)
    public ResponseEntity create(@RequestBody SignUpDTO signUpDTO) throws EbikkoException {
        ebikko.Principal principal = principalService.savePrincipal(signUpDTO);
        User user = userService.convertPrincipal(principal);
        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(user, signUpDTO.getPassword(), new ArrayList<GrantedAuthority>());
        SecurityContextHolder.getContext().setAuthentication(auth);
        return new ResponseEntity(CREATED);
    }

    @RequestMapping(method = GET, path = "/mandate")
    public ResponseEntity getMandates(Authentication auth) {
        List<Mandate> mandates = mandateService.getMandates((User) auth.getPrincipal());
        return new ResponseEntity(mandates, HttpStatus.OK);
    }
}
