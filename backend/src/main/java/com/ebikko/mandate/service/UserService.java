package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.User;
import ebikko.EbikkoException;
import ebikko.Principal;
import ebikko.Property;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.ebikko.mandate.model.User.UserType;
import static java.lang.String.format;
import static org.apache.commons.lang.StringUtils.isBlank;

@Service
public class UserService {

    private static final Log logger = LogFactory.getLog(UserService.class);
    private final SessionService sessionService;
    private final MerchantService merchantService;

    @Autowired
    public UserService(SessionService sessionService, MerchantService merchantService) {
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
                    String customerId = getCustomerId(session, principal);
                    UserType userType = isBlank(merchantId) ? UserType.CUSTOMER : UserType.MERCHANT;
                    return new User(principal.getUid(), userType == UserType.CUSTOMER ? customerId : merchantId, principal.getUserName(), principal.getName(), userType);
                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Merchant getMerchant(User user) {
        return merchantService.getMerchant(user.getId());
    }

    private String getCustomerId(Session session, Principal principal) throws EbikkoException {
        return getPropertyValue(session, principal, "Customer ID");
    }

    private String getMerchantId(Session session, Principal principal) throws EbikkoException {
        return getPropertyValue(session, principal, "Merchant ID");
    }

    private String getPropertyValue(Session session, Principal principal, String propertyName) throws EbikkoException {
        Property property = session.getPropertyByName(propertyName);
        if (property == null) {
            logger.error(format("Property %s is missing!", propertyName));
        }

        return session.getPrincipalPropertyValueById(property.getUid(), principal.getUid());
    }
}
