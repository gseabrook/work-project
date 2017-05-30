package com.ebikko.mandate.web.dto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.math.BigDecimal;

import static com.ebikko.ValidatorUtil.errorWithMessage;
import static java.lang.String.format;
import static org.apache.commons.lang.StringUtils.isBlank;

public class ValidBigDecimalValidator implements ConstraintValidator<ValidBigDecimal, String> {

    private BigDecimal min;
    private BigDecimal bigDecimal;
    private String field;

    @Override
    public void initialize(ValidBigDecimal constraintAnnotation) {
        min = new BigDecimal(constraintAnnotation.min());
        field = constraintAnnotation.field();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {

        if (isBlank(value)) {
            return errorWithMessage(field + " cannot be blank", context);
        }

        try {
            bigDecimal = new BigDecimal(value);
        } catch (NumberFormatException exception) {
            return errorWithMessage(format("'%s' is not a valid %s", value, field), context);
        }

        boolean valid = bigDecimal.compareTo(min) > -1;
        return valid ? true : errorWithMessage(format("%s must be greater than %s", field, min.toString()), context);
    }
}
