package com.ebikko.mandate;

import com.ebikko.mandate.model.ErrorResponse;
import com.ebikko.mandate.model.ValidationError;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultMatcher;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.isEmptyOrNullString;
import static org.hamcrest.Matchers.not;
import static org.hamcrest.core.Is.is;

public class MandateControllerResponseMatchers {

    public static MandateControllerResponseMatchers response() {
        return new MandateControllerResponseMatchers();
    }

    public ResultMatcher hasErrorForField(final String field, final String error) {
        return new ResultMatcher() {
            @Override
            public void match(MvcResult result) throws Exception {
                String contentAsString = result.getResponse().getContentAsString();
                if (StringUtils.isBlank(contentAsString)) {
                    assertThat("Expected error for " + field + " but response is empty", contentAsString, not(isEmptyOrNullString()));
                    return;
                }

                ErrorResponse errorResponse = new ObjectMapper().readValue(contentAsString, ErrorResponse.class);

                List<ValidationError> fieldErrors = errorResponse.getFieldErrors();

                boolean matched = false;
                for (ValidationError validationError : fieldErrors) {
                    if (validationError.getField().equals(field)) {
                        matched = true;
                        assertThat(validationError.getMessage(), containsString(error));
                    }
                }

                if (!matched) {
                    assertThat("Could not find validation error for field " + field, matched, is(true));
                }
            }
        };
    }
}
