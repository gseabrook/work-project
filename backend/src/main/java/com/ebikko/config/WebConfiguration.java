package com.ebikko.config;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.mandate.model.DisplayEnum;
import com.fasterxml.jackson.databind.module.SimpleModule;
import ebikko.EbikkoException;
import ebikko.Repository;
import ebikko.Session;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorViewResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Map;
import java.util.Properties;

import static java.lang.Integer.parseInt;

@Configuration
public class WebConfiguration {

    private static final Log logger = LogFactory.getLog(WebConfiguration.class);

    @Bean
    ErrorViewResolver supportPathBasedLocationStrategyWithoutHashes() {
        return new ErrorViewResolver() {
            @Override
            public ModelAndView resolveErrorView(HttpServletRequest request, HttpStatus status, Map<String, Object> model) {
                return (status == HttpStatus.NOT_FOUND || status == HttpStatus.METHOD_NOT_ALLOWED)
                        ? new ModelAndView("index.html", Collections.<String, Object>emptyMap(), HttpStatus.OK)
                        : null;
            }
        };
    }

    @Bean
    public Jackson2ObjectMapperBuilder jackson2ObjectMapperBuilder() {
        SimpleModule m = new SimpleModule();
        m.addSerializer(DisplayEnum.class, new DisplayEnumSerializer());
        return new Jackson2ObjectMapperBuilder().modules(m);
    }

    @Autowired
    private SessionService sessionService;

    @Bean
    public MailSender mailSender() throws EbikkoException {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        Repository repository = sessionService.performSessionAction(new SessionAction<Repository>() {
            @Override
            public Repository perform(Session session) {
                return session.getRepository();
            }
        });

        String host = repository.getProperty("email.host");
        String port = repository.getProperty("email.port");
        String username = repository.getProperty("email.username");
        String password = repository.getProperty("email.password");

        logger.info("-----Mail Sender Properties-----");
        logger.info("Host: " + host);
        logger.info("Port: " + port);
        logger.info("Username: " + username);
        logger.info("Password: " + password);
        logger.info("---------------------------------");

        mailSender.setHost(host);
        mailSender.setPort(parseInt(port));
        mailSender.setUsername(username);
        mailSender.setPassword(password);

        Properties properties = new Properties();
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.starttls.required", true);
        properties.put("mail.smtp.auth", true);
        mailSender.setJavaMailProperties(properties);

        return mailSender;
    }
}
