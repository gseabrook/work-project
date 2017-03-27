package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import static com.ebikko.mandate.builder.BankBuilder.exampleBank;
import static com.ebikko.mandate.builder.MerchantBuilder.exampleMerchant;
import static com.google.common.collect.Lists.newArrayList;

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

    public static MandateBuilder exampleMandateBuilder() {
        MandateBuilder mandateBuilder = new MandateBuilder()
                .with("referenceNumber", String.valueOf(Math.random()))
                .with("registrationDate", "2017-03-25")
                .with("amount", "123.45")
                .with("frequency", "MONTHLY")
                .with("merchant", "c22816ad803c47ed83400bc787d06ed4-cf4ad5cb478c4c36a3dec97e16d81091");

        Map<String, Object> customer = new HashMap<>();
        customer.put("name", "Joe");
        customer.put("emailAddress", "test@example.com");
        customer.put("idType", "PASSPORT_NUMBER");
        customer.put("idValue", String.valueOf(ThreadLocalRandom.current().nextInt(1, 999999999)));
        Map<String, Object> bank = new HashMap<>();
        bank.put("code", "HSBC0222");
        bank.put("name", "HSBC");
        bank.put("id", "b7bc8b7449614d159ce0869306f04d36-e90431d4422b4463b30d8dcf70d4d78e");

        ArrayList<Map<String, Object>> bankAccounts = new ArrayList<Map<String, Object>>();
        Map<String, Object> bankAccount = new HashMap<>();
        bankAccount.put("bank", bank);
        bankAccount.put("accountNumber", "242536");
        bankAccounts.add(bankAccount);

        customer.put("bankAccounts", bankAccounts);

        mandateBuilder.with("customer", customer);

        return mandateBuilder;
    }

    public Object get(String field) {
        return mandate.get(field);
    }

    public static Mandate exampleMandate() {
        CustomerBankAccount customerBankAccount = new CustomerBankAccount("ABC-123", exampleBank(), "11223344");

        Customer customer = new Customer("abc-123","Joe", "test@example.com", "0111234456", "54321234", IDType.PASSPORT_NUMBER, newArrayList(customerBankAccount));

        return new Mandate("ABC-123", new Date(), BigDecimal.TEN, MandateFrequency.MONTHLY, customer, exampleMerchant());
    }
}
