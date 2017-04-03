package com.ebikko.config;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.service.UserService;
import ebikko.EbikkoException;
import ebikko.Principal;
import ebikko.Repository;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EbikkoAuthenticationManager implements AuthenticationProvider {

    private static final Log logger = LogFactory.getLog(EbikkoAuthenticationManager.class);
    private final SessionService sessionService;
    private final UserService userService;

    @Autowired
    public EbikkoAuthenticationManager(SessionService sessionService, UserService userService) {
        this.sessionService = sessionService;
        this.userService = userService;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        final String username = authentication.getName();
        final String password = authentication.getCredentials().toString();

        try {
            Principal p = sessionService.performSessionAction(new SessionAction<Principal>() {
                @Override
                public Principal perform(Session session) throws EbikkoException {
                    boolean validCredentials;
                    Repository repository = session.getRepository();

                    if (username.contains("@")) {
                        List<Principal> principalByEmail = session.getPrincipalByEmail(username);
                        if (principalByEmail.isEmpty()) {
                            throw new BadCredentialsException("Invalid username or password");
                        }
                        validCredentials = repository.verifyCredentials(principalByEmail.get(0).getUserName(), password);
                    } else {
                        validCredentials = repository.verifyCredentials(username, password);
                    }

                    if (validCredentials) {
                        Principal principal = session.getPrincipalByUserName(username);
                        principal.getProfile(); // To avoid lazy loading issues later
                        return principal;
                    } else {
                        throw new BadCredentialsException("Invalid username or password");
                    }
                }
            });
            User user = userService.convertPrincipal(p);
            return new UsernamePasswordAuthenticationToken(user, password, new ArrayList<GrantedAuthority>());
        } catch (EbikkoException e) {
            logger.warn("Error authenticating " + username + " / " + password, e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.isAssignableFrom(UsernamePasswordAuthenticationToken.class);
    }
}
