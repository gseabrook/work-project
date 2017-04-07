package com.ebikko;

import javax.validation.ConstraintValidatorContext;

public class ValidatorUtil {

    public static boolean errorWithMessage(String message, ConstraintValidatorContext context) {
        context.disableDefaultConstraintViolation();
        context.buildConstraintViolationWithTemplate(message)
                .addConstraintViolation();
        return false;
    }
}
