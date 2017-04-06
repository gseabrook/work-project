package com.ebikko.config;

import com.ebikko.mandate.model.DisplayEnum;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

public class DisplayEnumSerializer extends JsonSerializer<DisplayEnum> {
    @Override
    public void serialize(DisplayEnum value, JsonGenerator gen, SerializerProvider serializers) throws IOException, JsonProcessingException {
        gen.writeStartObject();
        gen.writeFieldName("value");
        gen.writeString(value.toString());
        gen.writeFieldName("displayValue");
        gen.writeString(value.getDisplayValue());
        gen.writeEndObject();
    }
}
