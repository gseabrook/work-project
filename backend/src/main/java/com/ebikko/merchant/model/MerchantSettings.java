package com.ebikko.merchant.model;

import com.ebikko.mandate.model.MandateFrequency;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embeddable;
import java.util.Set;

@Embeddable
public class MerchantSettings {

    @Column
    private String logoFileLocation;
    @ElementCollection
    private Set<MandateFrequency> selectedFrequencies;
    @ElementCollection
    private Set<String> purposeOfPayments;

    public MerchantSettings() {}

    public String getLogoFileLocation() {
        return logoFileLocation;
    }

    public void setLogoFileLocation(String logoFileLocation) {
        this.logoFileLocation = logoFileLocation;
    }

    public Set<MandateFrequency> getSelectedFrequencies() {
        return selectedFrequencies;
    }

    public void setSelectedFrequencies(Set<MandateFrequency> selectedFrequencies) {
        this.selectedFrequencies = selectedFrequencies;
    }

    public Set<String> getPurposeOfPayments() {
        return purposeOfPayments;
    }

    public void setPurposeOfPayments(Set<String> purposeOfPayments) {
        this.purposeOfPayments = purposeOfPayments;
    }
}
