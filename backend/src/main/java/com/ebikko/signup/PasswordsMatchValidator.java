package com.ebikko.signup;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import static org.apache.commons.lang3.StringUtils.isBlank;

public class PasswordsMatchValidator implements ConstraintValidator<PasswordsMatch, SignUpDTO> {
    @Override
    public void initialize(PasswordsMatch constraintAnnotation) {

    }

    @Override
    public boolean isValid(SignUpDTO value, ConstraintValidatorContext context) {
        // 'NotBlank' validation will catch this, we don't need to repeat here
        if (isBlank(value.getPassword()) && isBlank(value.getRepeatPassword())) {
            return true;
        }
        return value.getPassword().equals(value.getRepeatPassword());
    }
}
