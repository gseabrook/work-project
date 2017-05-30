package com.ebikko.mandate.service;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.User;
import com.ebikko.signup.SignUpDTO;
import com.ebikko.signup.UserVerificationToken;
import com.ebikko.signup.UserVerificationTokenService;
import ebikko.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static org.apache.commons.lang3.StringUtils.isBlank;

@Service
public class PrincipalService {

    private final SessionService sessionService;
    private final CustomerService customerService;
    private final UserService userService;
    private final UserVerificationTokenService userVerificationTokenService;

    @Autowired
    public PrincipalService(SessionService sessionService, CustomerService customerService, UserService userService,
                            UserVerificationTokenService userVerificationTokenService) {
        this.sessionService = sessionService;
        this.customerService = customerService;
        this.userService = userService;
        this.userVerificationTokenService = userVerificationTokenService;
    }

    public Principal createPrincipal(final SignUpDTO signUpDTO) throws EbikkoException {
        Customer customer = customerService.getCustomerByEmailAddress(signUpDTO.getEmail());

        if (customer == null) {
            customer = customerService.save(signUpDTO.getEmail());
        }

        final Customer finalCustomer = customer;
        return sessionService.performSessionAction(new SessionAction<Principal>() {
            @Override
            public Principal perform(Session session) throws EbikkoException {
                Property customerId = session.getPropertyByName("Customer ID");
                Profile profile = session.getProfileByName("End User");

                Principal principal = new Principal(session, finalCustomer.getName(), false);
                principal.setEmail(signUpDTO.getEmail());
                principal.setUserName(signUpDTO.getEmail());
                principal.setPassword(signUpDTO.getPassword());
                principal.setValue(customerId, finalCustomer.getId().toString());
                principal.setType(Principal.TYPE_PERSON);
                principal.setCanLogin(false);
                principal.setProfile(profile);
                principal.save();
                return principal;
            }
        });
    }

    public Principal createPrincipal(final Customer customer) throws EbikkoException {
        Principal principal = sessionService.performSessionAction(new SessionAction<Principal>() {
            @Override
            public Principal perform(Session session) throws EbikkoException {
                Property customerId = session.getPropertyByName("Customer ID");
                Profile profile = session.getProfileByName("End User");

                Principal principal = new Principal(session, customer.getName(), false);
                principal.setEmail(customer.getEmailAddress());
                principal.setUserName(customer.getEmailAddress());
                principal.setValue(customerId, customer.getId().toString());
                principal.setType(Principal.TYPE_PERSON);
                principal.setCanLogin(false);
                principal.setProfile(profile);
                principal.save();
                return principal;
            }
        });

        customer.setPrincipalUid(principal.getUid());
        customerService.save(customer);
        return principal;
    }

    public Principal activatePrincipal(final String token, final String password) throws EbikkoException {
        final UserVerificationToken verificationToken = userVerificationTokenService.findByToken(token);

        Principal principal = sessionService.performSessionAction(new SessionAction<Principal>() {
            @Override
            public Principal perform(Session session) throws EbikkoException {
                Principal principal = session.getPrincipal(verificationToken.getPrincipalUid());
                principal.setCanLogin(true);
                if (!isBlank(password)) {
                    principal.setPassword(password);
                }
                // The addition values are not loaded so if we save without setting them they will be wiped out
                Property customerId = session.getPropertyByName("Customer ID");
                String value = session.getPrincipalPropertyValueById(customerId.getUid(), principal.getUid());
                principal.setValue(customerId, value);
                principal.save();
                return principal;
            }
        });

        User user = userService.convertPrincipal(principal);
        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(user, password, new ArrayList<GrantedAuthority>());
        SecurityContextHolder.getContext().setAuthentication(auth);

        return principal;
    }

    public Principal activatePrincipal(String token) throws EbikkoException {
        return activatePrincipal(token, null);
    }

    public Principal findByEmail(final String email) throws EbikkoException {
        if (isBlank(email)) {
            return null;
        }

        List<Principal> principals = sessionService.performSessionAction(new SessionAction<List<Principal>>() {
            @Override
            public List<Principal> perform(Session session) throws EbikkoException {
                return session.getPrincipalByEmail(email);
            }
        });
        return principals.isEmpty() ? null : principals.get(0);
    }

    public Principal findById(final String id) throws EbikkoException {
        return sessionService.performSessionAction(new SessionAction<Principal>() {
            @Override
            public Principal perform(Session session) throws EbikkoException {
                return session.getPrincipal(id);
            }
        });
    }
}
