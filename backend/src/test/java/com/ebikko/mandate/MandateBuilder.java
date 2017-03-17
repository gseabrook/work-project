package com.ebikko.mandate;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MandateBuilder {

    private Map<String, Object> mandate = new HashMap<>();

    public String toJson() {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.setSerializationInclusion(JsonInclude.Include.ALWAYS);
            return objectMapper.writeValueAsString(mandate);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    public MandateBuilder with(String field, Object value) {
        mandate.put(field, value);
        return this;
    }

    public MandateBuilder without(String field) {
        mandate.remove(field);
        return this;
    }

    public static MandateBuilder exampleMandate() {
        MandateBuilder mandateBuilder = new MandateBuilder()
                .with("referenceNumber", "123abc")
                .with("registrationDate", "2017-03-25")
                .with("amount", "123.45")
                .with("frequency", "MONTHLY");

        Map<String, Object> customer = new HashMap<>();
        customer.put("name", "Joe");
        customer.put("emailAddress", "test@example.com");
        customer.put("idType", "PASSPORT_NUMBER");
        customer.put("idValue", "123456");

        Map<String, Object> bank = new HashMap<>();
        bank.put("code", "HSBC0222");
        bank.put("name", "HSBC");

        ArrayList<Map<String, Object>> bankAccounts = new ArrayList<Map<String, Object>>();
        Map<String, Object> bankAccount = new HashMap<>();
        bankAccount.put("bank", bank);
        bankAccount.put("accountNumber", "242536");
        bankAccounts.add(bankAccount);

        customer.put("bankAccounts", bankAccounts);

        mandateBuilder.with("customer", customer);

        return mandateBuilder;
    }
}
