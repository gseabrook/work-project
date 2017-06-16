package com.ebikko.mandate.service;

import com.ebikko.SessionService;
import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.User;
import com.ebikko.signup.UserVerificationToken;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
    public EmailService(MailSender mailSender, SessionService sessionService) {
        this.mailSender = (JavaMailSenderImpl) mailSender;
        this.appUrl = sessionService.loadRepositoryProperty("mdd.app.url");
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

    public void sendCustomerMandateAuthorisedEmail(Mandate mandate) {
        String recipientAddress = mandate.getCustomer().getEmailAddress();
        String subject = "MyDirectDebit - Mandate authorised";
        String message = "A new mandate has been authorised for you";
        message = addMandateDetails(mandate, message);
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
        String message = "A new mandate is pending your authorisation, please login and review";
        message = addMandateDetails(mandate, message);
        message += "<br/>" + appUrl;
        sendEmail(recipientAddress, subject, message);
    }

    public void sendCustomerMandateTerminationRequested(Mandate mandate) {
        String recipientAddress = mandate.getCustomer().getEmailAddress();
        String subject = "MyDirectDebit - Mandate termination has been requested";
        String message = "We are processing a request to terminate one of your mandates";
        message = addMandateDetails(mandate, message);
        sendEmail(recipientAddress, subject, message);
    }

    public void sendCustomerMandateTerminatedEmail(Mandate mandate) {
        String recipientAddress = mandate.getCustomer().getEmailAddress();
        String subject = "MyDirectDebit - Mandate has been terminated";
        String message = "One of your mandates has been terminated";
        message = addMandateDetails(mandate, message);
        message += "<br/>Please log in to review - " + appUrl;
        sendEmail(recipientAddress, subject, message);
    }

    private String addMandateDetails(Mandate mandate, String message) {
        message += "<br/><br/>Merchant: " + mandate.getMerchant().getCompanyName();
        message += "<br/>Amount: " + mandate.getAmount();
        message += "<br/>Frequency: " + mandate.getFrequency().getDisplayValue();
        return message;
    }

    public void sendCustomerMandateAuthorisationRequestedEmail(Mandate mandate) {
        String recipientAddress = mandate.getCustomer().getEmailAddress();
        String subject = "MyDirectDebit - Mandate authorisation has been requested";
        String message = "We are processing a request to authorise a mandate";
        message = addMandateDetails(mandate, message);
        sendEmail(recipientAddress, subject, message);
    }
}
