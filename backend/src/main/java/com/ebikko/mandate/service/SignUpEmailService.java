package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.model.UserVerificationToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class SignUpEmailService {

    private final MailSender mailSender;

    @Autowired
    public SignUpEmailService(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendSignUpConfirmationEmail(User user, String token) {
        String recipientAddress = user.getEmailAddress();
        String subject = "Sign Up Confirmation";
        String confirmationUrl = "http://localhost:8080/mydirectdebit/signup/confirm?token=" + token;
        String message = confirmationUrl;

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo("graham.seabrook@ag-isolutions.com");
        email.setSubject(subject);
        email.setText(message);
        mailSender.send(email);
    }

    public void sendNewCustomerEmail(UserVerificationToken userVerificationToken, Customer customer) {
        String recipientAddress = customer.getEmailAddress();
        String subject = "Welcome to MyDirectDebit";
        String confirmationUrl = "http://localhost:8080/mydirectdebit/signup?token=" + userVerificationToken.getToken();
        String message = confirmationUrl;

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo("graham.seabrook@ag-isolutions.com");
        email.setSubject(subject);
        email.setText(message);
        mailSender.send(email);
    }
}
