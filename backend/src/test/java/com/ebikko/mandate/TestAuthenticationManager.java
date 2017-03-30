package com.ebikko.mandate;

import com.ebikko.SessionService;
import com.ebikko.config.EbikkoAuthenticationManager;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.service.UserService;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class TestAuthenticationManager extends EbikkoAuthenticationManager {

    private User user;

    public TestAuthenticationManager(SessionService sessionService, UserService userService) {
        super(sessionService, userService);
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        return new UsernamePasswordAuthenticationToken(user, "abc123", new ArrayList<GrantedAuthority>());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }

    public void clear() {
        user = null;
    }
}
