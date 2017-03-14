package com.ebikko.mandate;

public class MandateBuilder {

    // Controller requires double quotes, but single are more readable
    public static String exampleJson() {
        String s = "{" +
                "'referenceNumber': '123abc', " +
                "'registrationDate': '2017-03-25', " +
                "'amount': '123.45', " +
                "'frequency': 'MONTHLY', " +
                "'customer': {" +
                "'name': 'Joe'," +
                "'emailAddress': 'test@example.com'," +
                "'id': {" +
                "'id': '123456'," +
                "'idType': 'PASSPORT_NUMBER'" +
                "}," +
                "'bankAccount': {" +
                "'bankName': 'HSBC', " +
                "'accountNumber': '242536' " +
                "}" +
                "}" +
                "}";
        return s.replaceAll("'", "\"");
    }
}
