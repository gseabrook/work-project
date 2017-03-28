package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Merchant;
import ebikko.EbikkoException;
import ebikko.Principal;
import ebikko.Property;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final SessionService sessionService;
    private final MerchantService merchantService;

    @Autowired
    public UserService(SessionService sessionService, MerchantService merchantService ) {
        this.sessionService = sessionService;
        this.merchantService = merchantService;
    }

    public Merchant getMerchant(final Principal principal) {
        try {
            return sessionService.performSessionAction(new SessionAction<Merchant>() {
                @Override
                public Merchant perform(Session session) throws EbikkoException {
                    Property merchantIdProperty = session.getPropertyByName("Merchant ID");
                    Object value = principal.getValue(merchantIdProperty);
                    return merchantService.getMerchant(value.toString());
                }
            });

        } catch (EbikkoException e) {
            throw new RuntimeException(e);
        }
    }

}
