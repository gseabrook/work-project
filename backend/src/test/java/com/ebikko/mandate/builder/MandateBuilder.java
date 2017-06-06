package com.ebikko.mandate.builder;

import com.ebikko.mandate.model.Customer;
import com.ebikko.mandate.model.Mandate;
import com.ebikko.mandate.model.MandateStatus;
import com.ebikko.mandate.model.Merchant;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import static com.ebikko.mandate.builder.CustomerBuilder.exampleCustomer;
import static com.ebikko.mandate.builder.MerchantBuilder.exampleMerchant;
import static com.ebikko.mandate.model.MandateFrequency.MONTHLY;
import static com.ebikko.mandate.model.MandateStatus.APPROVED;

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
                .with("status", "-1")
                .with("maximumFrequency", "1")
                .with("merchant", 7l);

        Map<String, Object> customer = new HashMap<>();
        customer.put("name", "Joe");
        customer.put("emailAddress", "test@example.com");
        customer.put("idType", "PASSPORT_NUMBER");
        customer.put("idValue", String.valueOf(ThreadLocalRandom.current().nextInt(1, 999999999)));

        Map<String, Object> bank = new HashMap<>();
        bank.put("code", "HSBC0222");
        bank.put("name", "HSBC");
        bank.put("id", 9l);

        mandateBuilder.with("customer", customer);

        return mandateBuilder;
    }

    public static Mandate exampleMandate(MandateStatus status, Customer customer, Merchant merchant) {
        Mandate mandate = new Mandate();
        mandate.setReferenceNumber("ABC-123");
        mandate.setRegistrationDate(new Date());
        mandate.setAmount(BigDecimal.TEN);
        mandate.setFrequency(MONTHLY);
        mandate.setMaximumFrequency(1);
        mandate.setCustomer(customer);
        mandate.setMerchant(merchant);
        if (!customer.getBankAccounts().isEmpty()) {
            mandate.setCustomerBankAccount(customer.getBankAccounts().get(0));
        }
        mandate.setStatus(status);
        customer.addMandate(mandate);
        merchant.addMandate(mandate);
        return mandate;
    }

    public static Mandate exampleMandate(Customer customer) {
        return exampleMandate(APPROVED, customer);
    }

    public static Mandate exampleMandate() {
        return exampleMandate(APPROVED);
    }

    public static Mandate exampleMandate(MandateStatus status) {
        return exampleMandate(status, exampleCustomer());
    }

    public static Mandate exampleMandate(MandateStatus status, Customer customer) {
        return exampleMandate(status, customer, exampleMerchant());
    }

}
