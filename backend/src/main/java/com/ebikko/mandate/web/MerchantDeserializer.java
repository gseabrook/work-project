package com.ebikko.mandate.web;

import com.ebikko.mandate.model.Merchant;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import org.springframework.beans.factory.annotation.Configurable;

import java.io.IOException;

@Configurable
public class MerchantDeserializer extends JsonDeserializer<Merchant> {

    @Override
    public Merchant deserialize(final JsonParser p, DeserializationContext ctxt) throws IOException {
        if (p.getCurrentToken().equals(JsonToken.START_OBJECT)) {
            return p.getCodec().readValue(p, Merchant.class);
        } else {
            String merchantId = p.getText();
            return merchantId == null ? null : new Merchant(Long.valueOf(merchantId));
        }
    }
}
