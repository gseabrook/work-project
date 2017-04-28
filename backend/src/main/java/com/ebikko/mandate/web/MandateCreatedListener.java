package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.event.MandateCreatedEvent;
import com.ebikko.mandate.service.EmailService;
import com.ebikko.mandate.service.PrincipalService;
import com.ebikko.signup.UserVerificationToken;
import com.ebikko.signup.UserVerificationTokenService;
import ebikko.EbikkoException;
import ebikko.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class MandateCreatedListener {

    private final PrincipalService principalService;
    private final UserVerificationTokenService userVerificationTokenService;
    private final EmailService emailService;

    @Autowired
    public MandateCreatedListener(PrincipalService principalService,
                                  UserVerificationTokenService userVerificationTokenService,
                                  EmailService emailService) {
        this.principalService = principalService;
        this.userVerificationTokenService = userVerificationTokenService;
        this.emailService = emailService;
    }

    @EventListener
    public void handleMandateCreatedEvent(MandateCreatedEvent mandateCreatedEvent) throws EbikkoException {
        Customer customer = mandateCreatedEvent.getMandate().getCustomer();
        if (customer.getPrincipalUid() == null) {
            Principal principal = principalService.createPrincipal(customer);
            sendSignUpEmail(customer, principal);
        } else {
            Principal principal = principalService.findById(customer.getPrincipalUid());

            if (principal.isCanLogin()) {
                emailService.sendCustomerMandateConfirmationEmail(mandateCreatedEvent.getMandate());
            } else {
                sendSignUpEmail(customer, principal);
            }
        }
    }

    private void sendSignUpEmail(Customer customer, Principal principal) {
        UserVerificationToken token = userVerificationTokenService.createUserVerificationToken(principal);
        emailService.sendNewCustomerEmail(token, customer);
    }
}
