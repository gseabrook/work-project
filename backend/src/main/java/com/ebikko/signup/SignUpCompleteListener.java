package com.ebikko.signup;

import com.ebikko.mandate.model.User;
import com.ebikko.mandate.model.UserVerificationToken;
import com.ebikko.mandate.model.event.SignUpCompleteEvent;
import com.ebikko.mandate.repository.UserVerificationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class SignUpCompleteListener {

    private final UserVerificationTokenRepository userVerificationTokenRepository;
    private final SignUpEmailService signUpEmailService;

    @Autowired
    public SignUpCompleteListener(UserVerificationTokenRepository userVerificationTokenRepository, SignUpEmailService signUpEmailService) {
        this.userVerificationTokenRepository = userVerificationTokenRepository;
        this.signUpEmailService = signUpEmailService;
    }

    @EventListener
    public void handleSignUpComplete(SignUpCompleteEvent signUpCompleteEvent) {
        String token = UUID.randomUUID().toString();
        User user = signUpCompleteEvent.getUser();
        UserVerificationToken userVerificationToken = new UserVerificationToken(token, user.getPrincipalId());

        userVerificationTokenRepository.save(userVerificationToken);
        signUpEmailService.sendSignUpConfirmationEmail(user, token);
    }
}
