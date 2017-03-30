package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.User;
import ebikko.EbikkoException;
import ebikko.Principal;
import ebikko.Property;
import ebikko.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.ebikko.mandate.model.User.*;

@Service
public class UserService {

    private final SessionService sessionService;
    private final MerchantService merchantService;

    @Autowired
    public UserService(SessionService sessionService, MerchantService merchantService ) {
        this.sessionService = sessionService;
        this.merchantService = merchantService;
    }

    public User convertPrincipal(final Principal principal) {
        try {
            return sessionService.performSessionAction(new SessionAction<User>() {
                @Override
                public User perform(Session session) throws EbikkoException {
                    principal.setSession(session);
                    String merchantId = getMerchantId(session, principal);
                    UserType userType = merchantId == null ? UserType.CUSTOMER : UserType.MERCHANT;
                    return new User(principal.getUid(), merchantId, principal.getUserName(), principal.getName(), userType);
                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Merchant getMerchant(User user) {
        return merchantService.getMerchant(user.getId());
    }

    private String getMerchantId(Session session, Principal principal) throws EbikkoException {
        Property merchantIdProperty = session.getPropertyByName("Merchant ID");
        return session.getPrincipalPropertyValueById(merchantIdProperty.getUid(), principal.getUid());
    }

}
