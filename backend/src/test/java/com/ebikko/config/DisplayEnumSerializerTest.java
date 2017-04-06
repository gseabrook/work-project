package com.ebikko.config;

import com.ebikko.mandate.model.IDType;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import org.junit.Test;

import java.io.StringWriter;
import java.io.Writer;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;

public class DisplayEnumSerializerTest {

    @Test
    public void shouldSerializeDisplayEnum() throws Exception {

        Writer jsonWriter = new StringWriter();
        JsonGenerator jsonGenerator = new JsonFactory().createGenerator(jsonWriter);
        SerializerProvider serializerProvider = new ObjectMapper().getSerializerProvider();

        new DisplayEnumSerializer().serialize(IDType.NRIC, jsonGenerator, serializerProvider);

        jsonGenerator.flush();
        assertThat(jsonWriter.toString(), is(equalTo("{\"value\":\"NRIC\",\"displayValue\":\"New IC Number\"}")));
    }
}