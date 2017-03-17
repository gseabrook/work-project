package com.ebikko.mandate.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class ValidationError {

    private final String field;
    private final String value;
    private final String message;

    @JsonCreator
    public ValidationError(@JsonProperty("field") String field,
                           @JsonProperty("value") Object value,
                           @JsonProperty("message") String message) {
        this.field = field;
        this.value = value == null ?  "" : value.toString();
        this.message = message;
    }

    public String getField() {
        return field;
    }

    public String getValue() {
        return value;
    }

    public String getMessage() {
        return message;
    }

}
