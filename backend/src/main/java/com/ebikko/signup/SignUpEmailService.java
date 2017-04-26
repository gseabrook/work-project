package com.ebikko.signup;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.model.UserVerificationToken;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import static java.lang.String.format;

@Service
public class SignUpEmailService {

    private final MailSender mailSender;
    private final String appUrl;

    private final static Log logger = LogFactory.getLog(SignUpEmailService.class);

    @Autowired
    public SignUpEmailService(MailSender mailSender, @Value("${app.url}") String appUrl) {
        this.mailSender = mailSender;
        this.appUrl = appUrl;
    }

    public void sendSignUpConfirmationEmail(User user, String token) {
        String recipientAddress = user.getEmailAddress();
        String subject = "Sign Up Confirmation";
        String confirmationUrl = appUrl + "/signup/confirm?token=" + token;
        String message = "Thanks for signing up to MyDirectDebit, the future of direct debit.\nPlease follow the link below to confirm your account\n";
        message += confirmationUrl;

        sendEmail(recipientAddress, subject, message);
    }

    public void sendNewCustomerEmail(UserVerificationToken userVerificationToken, Customer customer) {
        String recipientAddress = customer.getEmailAddress();
        String subject = "Welcome to MyDirectDebit";
        String confirmationUrl = appUrl + "/signup?token=" + userVerificationToken.getToken();
        String message = "Welcome to MyDirectDebit, the future of direct debit.\nPlease follow the link below to register and review your direct debits.\n";
        message += confirmationUrl;

        sendEmail(recipientAddress, subject, message);
    }

    private void sendEmail(String recipientAddress, String subject, String message) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setFrom("donotreply@mydirectdebit.com");
        email.setSubject(subject);
        email.setText(message);

        logger.debug(format("Sending email to %s, subject: %s", recipientAddress, subject));
        mailSender.send(email);
    }
}