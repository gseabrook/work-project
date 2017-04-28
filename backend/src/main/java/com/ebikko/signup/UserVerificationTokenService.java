package com.ebikko.signup;

import ebikko.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class UserVerificationTokenService {

    private final UserVerificationTokenRepository userVerificationTokenRepository;

    @Autowired
    public UserVerificationTokenService(UserVerificationTokenRepository userVerificationTokenRepository) {
        this.userVerificationTokenRepository = userVerificationTokenRepository;
    }

    public UserVerificationToken createUserVerificationToken(Principal principal) {
        String token = UUID.randomUUID().toString();
        UserVerificationToken userVerificationToken = new UserVerificationToken(token, principal.getUid());

        return userVerificationTokenRepository.save(userVerificationToken);
    }

    public UserVerificationToken findByToken(String token) {
        return userVerificationTokenRepository.findByToken(token);
    }
}
