package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import ebikko.EbikkoException;
import ebikko.Principal;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PrincipalService {

    private final SessionService sessionService;

    @Autowired
    public PrincipalService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    public void savePrincipal(final Customer customer) throws EbikkoException {
        sessionService.performSessionAction(new SessionAction<Void>() {
            @Override
            public Void perform(Session session) throws EbikkoException {
                Principal principal = new Principal(session, customer.getName(), false);
//                principal.setPassword();
                return null;
            }
        });
    }
}
