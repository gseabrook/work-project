package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.google.common.base.Function;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.List;

import static com.google.common.collect.Collections2.transform;
import static com.google.common.collect.Lists.newArrayList;

public class ErrorResponse {

    private final List<ValidationError> fieldErrors;

    @JsonCreator
    public ErrorResponse(@JsonProperty("fieldErrors") List<ValidationError> fieldErrors) {
        this.fieldErrors = fieldErrors;
    }

    public ErrorResponse(BindingResult bindingResult) {
        fieldErrors = newArrayList(transform(bindingResult.getFieldErrors(), new Function<FieldError, ValidationError>() {
            public ValidationError apply(FieldError input) {
                return new ValidationError(input.getField(), input.getRejectedValue(), input.getDefaultMessage());
            }
        }));
    }

    public ErrorResponse(InvalidFormatException exception) {
        String fieldName = exception.getPath().get(0).getFieldName();
        String message = "'" + exception.getValue() + "' is not a valid " + fieldName;
        ValidationError validationError = new ValidationError(fieldName, exception.getValue(), message);
        fieldErrors = newArrayList(validationError);
    }

    public List<ValidationError> getFieldErrors() {
        return fieldErrors;
    }
}
