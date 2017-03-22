package com.ebikko.mandate.service.translator;

import com.google.common.base.Predicate;

public class NotNullPredicate implements Predicate {
    @Override
    public boolean apply(Object input) {
        return input != null;
    }
}
