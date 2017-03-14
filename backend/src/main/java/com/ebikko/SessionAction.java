package com.ebikko;

import ebikko.EbikkoException;
import ebikko.Session;

public interface SessionAction<T> {

    T perform(Session session) throws EbikkoException;
}
