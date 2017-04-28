package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueReferenceValidator implements ConstraintValidator<UniqueReferenceNumber, String> {

    @Autowired
    private UserService userService;
    @Autowired
    private MandateService mandateService;

    @Override
    public void initialize(UniqueReferenceNumber constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Merchant merchant = userService.getMerchant((User) authentication.getPrincipal());
        return mandateService.findByMerchantAndReferenceNumber(merchant, value) == null;
    }
}
