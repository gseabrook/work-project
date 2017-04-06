package com.ebikko.mandate.model;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordsMatchValidator implements ConstraintValidator<PasswordsMatch, SignUpDTO> {
    @Override
    public void initialize(PasswordsMatch constraintAnnotation) {

    }

    @Override
    public boolean isValid(SignUpDTO value, ConstraintValidatorContext context) {
        if (value.getPassword() == null || value.getRepeatPassword() == null) {
            return false;
        }
        return value.getPassword().equals(value.getRepeatPassword());
    }
}
