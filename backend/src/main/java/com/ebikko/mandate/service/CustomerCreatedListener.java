package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.UserVerificationToken;
import com.ebikko.mandate.model.event.CustomerCreatedEvent;
import com.ebikko.signup.SignUpEmailService;
import ebikko.EbikkoException;
import ebikko.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class CustomerCreatedListener {

    private final PrincipalService principalService;
    private final UserVerificationTokenService userVerificationTokenService;
    private final SignUpEmailService signUpEmailService;

    @Autowired
    public CustomerCreatedListener(PrincipalService principalService, UserVerificationTokenService userVerificationTokenService,
                                   SignUpEmailService signUpEmailService) {
        this.principalService = principalService;
        this.userVerificationTokenService = userVerificationTokenService;
        this.signUpEmailService = signUpEmailService;
    }

    @EventListener
    public void handleCustomerCreated(CustomerCreatedEvent customerCreatedEvent) throws EbikkoException {
        Customer customer = customerCreatedEvent.getCustomer();
        Principal principal = principalService.createPrincipal(customer);
        UserVerificationToken token = userVerificationTokenService.createUserVerificationToken(principal);
        signUpEmailService.sendNewCustomerEmail(token, customer);
    }
}
