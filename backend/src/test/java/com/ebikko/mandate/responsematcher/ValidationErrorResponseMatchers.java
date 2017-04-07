package com.ebikko.mandate.responsematcher;

import com.ebikko.mandate.model.ErrorResponse;
import com.ebikko.mandate.model.ValidationError;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.base.Function;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultMatcher;

import java.util.List;

import static com.google.common.collect.Collections2.transform;
import static org.apache.commons.lang3.StringUtils.isBlank;
import static org.apache.commons.lang3.StringUtils.join;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;
import static org.hamcrest.core.Is.is;

public class ValidationErrorResponseMatchers {

    public static ValidationErrorResponseMatchers response() {
        return new ValidationErrorResponseMatchers();
    }

    public ResultMatcher hasErrorForField(final String field, final String error) {
        return new ResultMatcher() {
            @Override
            public void match(MvcResult result) throws Exception {
                String contentAsString = result.getResponse().getContentAsString();
                if (isBlank(contentAsString)) {
                    assertThat("Expected error for " + field + " but response is empty", contentAsString, not(isEmptyOrNullString()));
                    return;
                }

                ErrorResponse errorResponse = new ObjectMapper().readValue(contentAsString, ErrorResponse.class);

                List<ValidationError> validationErrors = errorResponse.getErrors();

                boolean matched = false;
                for (ValidationError validationError : validationErrors) {
                    if (validationError.getField().equals(field)) {
                        matched = true;
                        assertThat(validationError.getMessage(), containsString(error));
                    }
                }

                if (!matched) {
                    String message = join(transform(validationErrors, new Function<ValidationError, String>() {
                        public String apply(ValidationError input) {
                            return input.getField()+ " - " + input.getMessage();
                        }
                    }), ",");
                    assertThat("Could not find validation error for field " + field + ", but did find: " + message, matched, is(true));
                }
            }
        };
    }
}
