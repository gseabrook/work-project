package com.ebikko.mandate;

import com.ebikko.SessionService;
import com.ebikko.config.EbikkoAuthenticationManager;
import ebikko.Principal;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class TestAuthenticationManager extends EbikkoAuthenticationManager {

    private Principal principal;

    public TestAuthenticationManager(SessionService sessionService) {
        super(sessionService);
    }

    public void setPrincipal(Principal principal) {
        this.principal = principal;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        return new UsernamePasswordAuthenticationToken(principal, "abc123", new ArrayList<GrantedAuthority>());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }

    public void clear() {
        principal = null;
    }
}
