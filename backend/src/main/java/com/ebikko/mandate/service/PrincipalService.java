package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.SignUpDTO;
import ebikko.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PrincipalService {

    private final SessionService sessionService;
    private final CustomerService customerService;

    @Autowired
    public PrincipalService(SessionService sessionService, CustomerService customerService) {
        this.sessionService = sessionService;
        this.customerService = customerService;
    }

    public Principal savePrincipal(final SignUpDTO signUpDTO) throws EbikkoException {
        final Customer customer = customerService.getCustomerByEmailAddress(signUpDTO.getEmail());

        return sessionService.performSessionAction(new SessionAction<Principal>() {
            @Override
            public Principal perform(Session session) throws EbikkoException {
                Property customerId = session.getPropertyByName("Customer ID");
                Profile profile = session.getProfileByName("End User");

                Principal principal = new Principal(session, customer.getName(), false);
                principal.setEmail(signUpDTO.getEmail());
                principal.setUserName(signUpDTO.getEmail());
                principal.setPassword(signUpDTO.getPassword());
                principal.setValue(customerId, customer.getId().toString());
                principal.setType(Principal.TYPE_PERSON);
                principal.setCanLogin(true);
                principal.setProfile(profile);
                principal.save();
                return principal;
            }
        });
    }
}
