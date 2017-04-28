package com.ebikko.signup;

import com.ebikko.mandate.service.PrincipalService;
import ebikko.EbikkoException;
import ebikko.Principal;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import static com.ebikko.ValidatorUtil.errorWithMessage;

public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, SignUpDTO> {

    @Autowired
    private PrincipalService principalService;

    @Override
    public void initialize(UniqueEmail constraintAnnotation) {}

    @Override
    public boolean isValid(SignUpDTO value, ConstraintValidatorContext context) {

        try {
            Principal principal = principalService.findByEmail(value.getEmail());
            return principal == null || !principal.isCanLogin();
        } catch (EbikkoException e) {
            return errorWithMessage("Error loading principals!", context);
        }
    }
}
