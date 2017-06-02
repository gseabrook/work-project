package com.ebikko.signup;

import com.ebikko.mandate.model.ErrorResponse;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.model.event.SignUpCompleteEvent;
import com.ebikko.mandate.service.PrincipalService;
import com.ebikko.mandate.service.UserService;
import ebikko.EbikkoException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import static org.apache.commons.lang3.StringUtils.isBlank;
import static org.springframework.http.HttpStatus.*;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(SignUpController.SIGNUP_URL)
public class SignUpController {

    public static final String SIGNUP_URL = "/signup";
    private static Log logger = LogFactory.getLog(SignUpController.class);

    private final PrincipalService principalService;
    private final UserService userService;
    private final ApplicationEventPublisher applicationEventPublisher;

    @Autowired
    public SignUpController(PrincipalService principalService,
                            UserService userService, ApplicationEventPublisher applicationEventPublisher) {
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
            logger.error(bindingResult);
            return new ResponseEntity(new ErrorResponse(bindingResult), UNPROCESSABLE_ENTITY);
        }

        String token = signUpDTO.getToken();
        if (isBlank(token)) {
            ebikko.Principal principal = principalService.findByEmail(signUpDTO.getEmail());
            if (principal == null) {
                principal = principalService.createPrincipal(signUpDTO);
            } else {
                principalService.updatePassword(principal, signUpDTO.getPassword());
            }
            User user = userService.convertPrincipal(principal);
            applicationEventPublisher.publishEvent(new SignUpCompleteEvent(user));
            return new ResponseEntity(CREATED);
        } else {
            principalService.activatePrincipal(token, signUpDTO.getPassword());
            return new ResponseEntity(OK);
        }
    }
}

