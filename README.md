# MyDirectDebit

My current employer has kindly allowed me to upload a copy of the source code of my most recent project to assist me in my job hunt. It was written entirely by myself over the course of several months so should provide a good sense of how I like to code.

It won't compile as there are private JARs that the application requires so it is not possible to run it, but source is available for inspection.

If you have any questions please contact me at gseabrook at gmail dot com

## Overview
The application is for facilitating direct debit agreements between customers and merchants in Malaysia. Currently these are all done on paper but there is a drive from the government to digitalise the process, and this application hopes to capitalise on that.

Merchants are able to create a digital version of the form which can be emailed to a customer, who can then authorise the mandate using a government provided service called FPX. Effectively the customer logs into their online banking, and that log in is used to authorise the mandate agreement.

## Frontend
The front end of the application is written using Angular2, Material2 and Typescript, set up by using the Angular CLI. 

As recommended by the Angular team, all of the unit tests sit alongside the relevant production code in the *.spec.ts files.

## Backend
The back end of the application is written using Spring, Spring Boot, Hibernate and Maven. 

The tests all live in the test directory, within src. 

### Ebikko
Ebikko is the name of the internal system which is used for authentication and keeping a history of the mandates and is not included in this repository.
