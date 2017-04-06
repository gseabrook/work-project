package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.google.common.base.Function;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

import java.util.List;

import static com.google.common.collect.Collections2.transform;
import static com.google.common.collect.Lists.newArrayList;

public class ErrorResponse {

    private final List<ValidationError> errors;

    @JsonCreator
    public ErrorResponse(@JsonProperty("errors") List<ValidationError> errors) {
        this.errors = errors;
    }

    public ErrorResponse(BindingResult bindingResult) {
        errors = newArrayList(transform(bindingResult.getFieldErrors(), new Function<FieldError, ValidationError>() {
            public ValidationError apply(FieldError input) {
                return new ValidationError(input.getField(), input.getRejectedValue(), input.getDefaultMessage());
            }
        }));

        errors.addAll(newArrayList(transform(bindingResult.getGlobalErrors(), new Function<ObjectError, ValidationError>() {
            public ValidationError apply(ObjectError input) {
                return new ValidationError(input.getObjectName(), "", input.getDefaultMessage());
            }
        })));
    }

    public ErrorResponse(InvalidFormatException exception) {
        String fieldName = exception.getPath().get(0).getFieldName();
        String message = "'" + exception.getValue() + "' is not a valid " + fieldName;
        ValidationError validationError = new ValidationError(fieldName, exception.getValue(), message);
        errors = newArrayList(validationError);
    }

    public List<ValidationError> getErrors() {
        return errors;
    }
}
