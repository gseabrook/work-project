package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.User;
import com.ebikko.signup.UserVerificationToken;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import static java.lang.String.format;

@Service
public class EmailService {

    private final JavaMailSenderImpl mailSender;
    private final String appUrl;

    private final static Log logger = LogFactory.getLog(EmailService.class);

    @Autowired
    public EmailService(MailSender mailSender, @Value("${app.url}") String appUrl) {
        this.mailSender = (JavaMailSenderImpl) mailSender;
        this.appUrl = appUrl;
    }

    public void sendSignUpConfirmationEmail(User user, String token) {
        String recipientAddress = user.getEmailAddress();
        String subject = "Sign Up Confirmation";
        String confirmationUrl = appUrl + "/signup/confirm?token=" + token;
        String message = "Thanks for signing up to MyDirectDebit, the future of direct debit.<br/>Please follow the link below to confirm your account<br/>";
        message += confirmationUrl;

        sendEmail(recipientAddress, subject, message);
    }

    public void sendNewCustomerEmail(UserVerificationToken userVerificationToken, Customer customer) {
        String recipientAddress = customer.getEmailAddress();
        String subject = "Welcome to MyDirectDebit";
        String confirmationUrl = appUrl + "/signup?token=" + userVerificationToken.getToken();
        String message = "Welcome to MyDirectDebit, the future of direct debit.<br/>Please follow the link below to register and review your direct debits.<br/>";
        message += confirmationUrl;

        sendEmail(recipientAddress, subject, message);
    }

    public void sendCustomerMandateConfirmationEmail(Mandate mandate) {
        String recipientAddress = mandate.getCustomer().getEmailAddress();
        String subject = "MyDirectDebit - Mandate created";
        String message = "A new mandate has been created for you";
        message += "<br/><br/>Merchant: " + mandate.getMerchant().getCompanyName();
        message += "<br/>Amount: " + mandate.getAmount();
        message += "<br/>Frequency: " + mandate.getFrequency().getDisplayValue();
        message += "<br/>Please log in to review - " + appUrl;

        sendEmail(recipientAddress, subject, message);
    }

    private void sendEmail(String recipientAddress, String subject, String message) {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);

        try {
            mimeMessageHelper.setTo(recipientAddress);
            mimeMessageHelper.setFrom("donotreply@mydirectdebit.com");
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(message, true);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

        logger.debug(format("Sending email to %s, subject: %s", recipientAddress, subject));
        mailSender.send(mimeMessage);
    }

    public void sendPendingAuthorisationEmail(Mandate mandate) {
        String recipientAddress = mandate.getCustomer().getEmailAddress();
        String subject = "MyDirectDebit - Transaction pending authorisation";
        String message = "A new mandate is pending your authorisation, please follow the link to enter your bank details";
        message += "<br/><br/>Merchant: " + mandate.getMerchant().getCompanyName();
        message += "<br/>Amount: " + mandate.getAmount();
        message += "<br/>Frequency: " + mandate.getFrequency().getDisplayValue();
        message += "<br/>" + appUrl + "/mandate-form?id=" + mandate.getId();
        sendEmail(recipientAddress, subject, message);
    }
}
