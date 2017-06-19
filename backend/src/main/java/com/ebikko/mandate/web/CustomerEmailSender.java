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
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class CustomerEmailSender {

    private final PrincipalService principalService;
    private final UserVerificationTokenService userVerificationTokenService;
    private final EmailService emailService;

    @Autowired
    public CustomerEmailSender(PrincipalService principalService,
                               UserVerificationTokenService userVerificationTokenService,
                               EmailService emailService) {
        this.principalService = principalService;
        this.userVerificationTokenService = userVerificationTokenService;
        this.emailService = emailService;
    }

    @EventListener(condition = "#mandateUpdatedEvent.mandate.buyer instanceof T(Customer)")
    public void handleMandateUpdatedEvent(MandateUpdatedEvent mandateUpdatedEvent) throws EbikkoException {
        Mandate mandate = mandateUpdatedEvent.getMandate();
        Customer buyer = (Customer) mandate.getBuyer();


        switch (mandate.getStatus()) {
            case NEW:
                Principal principal;
                if (buyer.getPrincipalUid() == null) {
                    principal = principalService.createPrincipal(buyer);
                } else {
                    principal = principalService.findById(buyer.getPrincipalUid());
                }

                if (!StringUtils.isBlank(mandate.getReferenceNumber())) {
                    if (principal.isCanLogin()) {
                        emailService.sendPendingAuthorisationEmail(mandate);
                    } else {
                        sendSignUpEmail(buyer, principal);
                    }
                }
                break;

            case AWAITING_FPX_TERMINATION:
                emailService.sendCustomerMandateTerminationRequested(mandate);
                break;

            case AWAITING_FPX_AUTHORISATION:
                if (buyer.getPrincipalUid() == null) {
                    principal = principalService.createPrincipal(buyer);
                    sendSignUpEmail(buyer, principal);
                } else {
                    principal = principalService.findById(buyer.getPrincipalUid());

                    if (principal.isCanLogin()) {
                        emailService.sendCustomerMandateAuthorisationRequestedEmail(mandate);
                    } else {
                        sendSignUpEmail(buyer, principal);
                    }
                }
                break;

            case TRANSACTION_CANCELLED_BY_CUSTOMER:
                emailService.sendCustomerMandateTerminatedEmail(mandate);
                break;

            case APPROVED:
                emailService.sendCustomerMandateAuthorisedEmail(mandate);
                break;
        }
    }

    private void sendSignUpEmail(Customer customer, Principal principal) {
        UserVerificationToken token = userVerificationTokenService.createUserVerificationToken(principal);
        emailService.sendNewCustomerEmail(token, customer);
    }
}
