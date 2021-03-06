package com.ebikko.mandate.model;

import javax.persistence.*;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class MandateParty {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE)
    private Long id;
    @Column
    protected String emailAddress;
    @Column
    protected String phoneNumber;

    public abstract IDType getIdType();
    public abstract String getIdValue();
    public abstract String getName();
    public abstract Long getId();

    public String getEmailAddress() {
        return emailAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

}
