package com.ebikko.signup;

import org.apache.commons.lang.StringUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordsMatchValidator implements ConstraintValidator<PasswordsMatch, SignUpDTO> {
    @Override
    public void initialize(PasswordsMatch constraintAnnotation) {

    }

    @Override
    public boolean isValid(SignUpDTO value, ConstraintValidatorContext context) {
        // 'NotBlank' validation will catch this, we don't need to repeat here
        if (StringUtils.isBlank(value.getPassword()) && StringUtils.isBlank(value.getRepeatPassword())) {
            return true;
        }
        return value.getPassword().equals(value.getRepeatPassword());
    }
}
