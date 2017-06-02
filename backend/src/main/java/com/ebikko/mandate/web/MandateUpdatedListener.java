package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.event.MandateUpdatedEvent;
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
public class MandateUpdatedListener {

    private final PrincipalService principalService;
    private final UserVerificationTokenService userVerificationTokenService;
    private final EmailService emailService;

    @Autowired
    public MandateUpdatedListener(PrincipalService principalService,
                                  UserVerificationTokenService userVerificationTokenService,
                                  EmailService emailService) {
        this.principalService = principalService;
        this.userVerificationTokenService = userVerificationTokenService;
        this.emailService = emailService;
    }

    @EventListener
    public void handleMandateUpdatedEvent(MandateUpdatedEvent mandateUpdatedEvent) throws EbikkoException {
        Mandate mandate = mandateUpdatedEvent.getMandate();
        Customer customer = mandate.getCustomer();


        switch (mandate.getStatus()) {
            case NEW:
                if (customer.getPrincipalUid() == null) {
                    principalService.createPrincipal(customer);
                }

                emailService.sendPendingAuthorisationEmail(mandate);
                break;

            case AWAITING_FPX_TERMINATION:
                emailService.sendCustomerMandateTerminationRequested(mandate);
                break;

            case AWAITING_FPX_AUTHORISATION:
                if (customer.getPrincipalUid() == null) {
                    Principal principal = principalService.createPrincipal(customer);
                    sendSignUpEmail(customer, principal);
                } else {
                    Principal principal = principalService.findById(customer.getPrincipalUid());

                    if (principal.isCanLogin()) {
                        emailService.sendCustomerMandateAuthorisedEmail(mandate);
                    } else {
                        sendSignUpEmail(customer, principal);
                    }
                }
                break;

            case TRANSACTION_CANCELLED_BY_CUSTOMER:
                emailService.sendCustomerMandateTerminatedEmail(mandate);
                break;
        }
    }

    private void sendSignUpEmail(Customer customer, Principal principal) {
        UserVerificationToken token = userVerificationTokenService.createUserVerificationToken(principal);
        emailService.sendNewCustomerEmail(token, customer);
    }
}
