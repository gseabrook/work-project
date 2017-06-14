package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.service.MandateService;
import com.ebikko.mandate.service.UserService;
import com.ebikko.mandate.web.dto.MandateDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueReferenceValidator implements ConstraintValidator<UniqueReferenceNumber, MandateDTO> {

    @Autowired
    private UserService userService;
    @Autowired
    private MandateService mandateService;

    @Override
    public void initialize(UniqueReferenceNumber constraintAnnotation) {

    }

    @Override
    public boolean isValid(MandateDTO mandateDTO, ConstraintValidatorContext context) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Merchant merchant = userService.getMerchant((User) authentication.getPrincipal());
        Mandate mandate = mandateService.findByMerchantAndReferenceNumber(merchant, mandateDTO.getReferenceNumber());
        return mandate == null || mandate.getNodeId().equals(mandateDTO.getNodeId());
    }

}
