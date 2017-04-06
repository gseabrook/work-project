package com.ebikko.mandate.web;

import com.ebikko.mandate.model.ErrorResponse;
import com.ebikko.mandate.model.SignUpDTO;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.model.event.SignUpCompleteEvent;
import com.ebikko.mandate.service.PrincipalService;
import com.ebikko.mandate.service.UserService;
import com.ebikko.mandate.service.UserVerificationTokenService;
import ebikko.EbikkoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import static org.apache.commons.lang.StringUtils.isBlank;
import static org.springframework.http.HttpStatus.*;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(SignUpController.SIGNUP_URL)
public class SignUpController {

    public static final String SIGNUP_URL = "/signup";

    private final UserVerificationTokenService userVerificationTokenService;
    private final PrincipalService principalService;
    private final UserService userService;
    private final ApplicationEventPublisher applicationEventPublisher;

    @Autowired
    public SignUpController(UserVerificationTokenService userVerificationTokenService, PrincipalService principalService,
                            UserService userService, ApplicationEventPublisher applicationEventPublisher) {
        this.userVerificationTokenService = userVerificationTokenService;
        this.principalService = principalService;
        this.userService = userService;
        this.applicationEventPublisher = applicationEventPublisher;
    }

    @RequestMapping(path = "/confirm", method = RequestMethod.GET)
    public RedirectView confirmSignUp(@RequestParam String token) throws EbikkoException {
        principalService.activatePrincipal(token);
        return new RedirectView("/mydirectdebit/index.html");
    }

    @RequestMapping(method = POST)
    @ResponseBody
    public ResponseEntity create(@RequestBody @Validated SignUpDTO signUpDTO, BindingResult bindingResult) throws EbikkoException {

        if (bindingResult.hasErrors()) {
            return new ResponseEntity(new ErrorResponse(bindingResult), UNPROCESSABLE_ENTITY);
        }

        String token = signUpDTO.getToken();
        if (isBlank(token)) {
            ebikko.Principal principal = principalService.createPrincipal(signUpDTO);
            User user = userService.convertPrincipal(principal);
            applicationEventPublisher.publishEvent(new SignUpCompleteEvent(user));
            return new ResponseEntity(CREATED);
        } else {
            principalService.activatePrincipal(token, signUpDTO.getPassword());
            return new ResponseEntity(OK);
        }
    }
}

