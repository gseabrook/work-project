package com.ebikko.signup;

import com.ebikko.mandate.model.User;
import com.ebikko.mandate.model.event.SignUpCompleteEvent;
import com.ebikko.mandate.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class SignUpCompleteListener {

    private final UserVerificationTokenRepository userVerificationTokenRepository;
    private final EmailService emailService;

    @Autowired
    public SignUpCompleteListener(UserVerificationTokenRepository userVerificationTokenRepository, EmailService emailService) {
        this.userVerificationTokenRepository = userVerificationTokenRepository;
        this.emailService = emailService;
    }

    @EventListener
    public void handleSignUpComplete(SignUpCompleteEvent signUpCompleteEvent) {
        String token = UUID.randomUUID().toString();
        User user = signUpCompleteEvent.getUser();
        UserVerificationToken userVerificationToken = new UserVerificationToken(token, user.getPrincipalId());

        userVerificationTokenRepository.save(userVerificationToken);
        emailService.sendSignUpConfirmationEmail(user, token);
    }
}
