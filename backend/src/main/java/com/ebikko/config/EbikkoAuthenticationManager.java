package com.ebikko.config;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import ebikko.EbikkoException;
import ebikko.Principal;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;

import java.util.ArrayList;

public class EbikkoAuthenticationManager implements AuthenticationProvider {

    private static final Log logger = LogFactory.getLog(EbikkoAuthenticationManager.class);
    private final SessionService sessionService;

    public EbikkoAuthenticationManager(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        final String username = authentication.getName();
        final String password = authentication.getCredentials().toString();

        try {
            Principal p = sessionService.performSessionAction(new SessionAction<Principal>() {
                @Override
                public Principal perform(Session session) throws EbikkoException {
                    boolean b = session.getRepository().verifyCredentials(username, password);
                    if (b) {
                        Principal principalByUserName = session.getPrincipalByUserName(username);
                        principalByUserName.getProfile(); // To avoid lazy loading issues later
                        return principalByUserName;
                    } else {
                        throw new BadCredentialsException("Invalid username or password");
                    }
                }
            });
            return new UsernamePasswordAuthenticationToken(p, password, new ArrayList<GrantedAuthority>());
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
