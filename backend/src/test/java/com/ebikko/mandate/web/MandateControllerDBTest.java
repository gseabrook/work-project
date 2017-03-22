package com.ebikko.mandate.web;

import org.hamcrest.Matchers;
import org.hamcrest.core.Is;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.GregorianCalendar;
import java.util.Map;

import static com.ebikko.mandate.IDs.NodeTypes;
import static com.ebikko.mandate.IDs.NodeTypes.*;
import static com.ebikko.mandate.IDs.Nodes.AGI_MERCHANT;
import static com.ebikko.mandate.IDs.PropertyIDs;
import static com.ebikko.mandate.IDs.PropertyIDs.*;
import static com.ebikko.mandate.builder.MandateBuilder.exampleMandateBuilder;
import static com.ebikko.mandate.web.MandateController.MANDATE_URL;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MandateControllerDBTest extends AbstractEmbeddedDBControllerTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    public void shouldSaveAllTheFormData() throws Exception {

        mockMvc.perform(
                post(MANDATE_URL)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(exampleMandateBuilder().toJson()))
                .andExpect(status().isCreated());

        // Check mandate saved
        Map<String, Object> values = jdbcTemplate.queryForMap("select * from nodetype_" + EMANDATE_FORM);
        assertThat(values.get(REFERENCE_NUMBER), Matchers.<Object>is("123abc"));
        assertThat(values.get(FREQUENCY), Matchers.<Object>is("Monthly"));
        assertThat(values.get(MAXIMUM_AMOUNT), Matchers.<Object>is(new BigDecimal("123.45")));
        assertThat(values.get(ID_TYPE), Matchers.<Object>is("Passport Number"));
        assertThat(values.get(ID_NUMBER), Matchers.<Object>is("123456"));
        Timestamp date = (Timestamp) values.get(REGISTRATION_DATE);
        assertThat(date.getTime(), is(new GregorianCalendar(2017, 2, 25).getTime().getTime()));
        assertThat(values.get(MERCHANT_RECORD), Is.<Object>is(AGI_MERCHANT));

        // Check customer saved
        values = jdbcTemplate.queryForMap("select * from nodetype_" + CUSTOMER_INFO + " where " + EMAIL + " = 'test@example.com'" );
        assertThat(values.get(CUSTOMER_NAME), Matchers.<Object>is("Joe"));
        assertThat(values.get(EMAIL), Matchers.<Object>is("test@example.com"));
        assertThat(values.get(ID_TYPE), Matchers.<Object>is("Passport Number"));
        assertThat(values.get(ID_NUMBER), Matchers.<Object>is("123456"));

        String customerUid = (String) values.get("uid");

        // Check bank account created for customer
        values = jdbcTemplate.queryForMap("select * from node_refs where from_node_uid = '" + customerUid + "' AND property_uid = '" + PropertyIDs.CUSTOMER_BANK_ACCOUNT + "'" );
        String customerBankAccountUid = (String) values.get("to_node_uid");

        values =  jdbcTemplate.queryForMap("select * from nodetype_" + NodeTypes.CUSTOMER_BANK_ACCOUNT + " where uid = '" + customerBankAccountUid + "'");
        assertThat(values.get(ACCOUNT_NUMBER), Matchers.<Object>is("242536"));

        // Check bank account has reference to bank
        String bankInformationUid = jdbcTemplate.queryForObject("select uid from nodetype_" + BANK_INFORMATION + " where " + BANK_CODE + " = 'HSBC0222'", String.class);
        assertThat(values.get(BANK_NAME), Matchers.<Object>is(bankInformationUid));
    }
}