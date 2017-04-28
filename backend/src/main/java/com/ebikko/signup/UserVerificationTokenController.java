package com.ebikko.signup;

import com.ebikko.mandate.service.PrincipalService;
import ebikko.EbikkoException;
import ebikko.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(UserVerificationTokenController.TOKEN_URL)
public class UserVerificationTokenController {

    public static final String TOKEN_URL = "/token";
    private final UserVerificationTokenService userVerificationTokenService;
    private final PrincipalService principalService;

    @Autowired
    public UserVerificationTokenController(UserVerificationTokenService userVerificationTokenService, PrincipalService principalService) {
        this.userVerificationTokenService = userVerificationTokenService;
        this.principalService = principalService;
    }

    @RequestMapping(method = RequestMethod.GET, path = "/{token}")
    public UserVerificationToken getToken(@PathVariable String token) throws EbikkoException {
        UserVerificationToken userVerificationToken = userVerificationTokenService.findByToken(token);
        Principal principal = principalService.findById(userVerificationToken.getPrincipalUid());
        userVerificationToken.setEmailAddress(principal.getEmail());
        return userVerificationToken;
    }
}
