package com.ebikko.merchant.model;

import com.ebikko.mandate.model.MandateFrequency;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embeddable;
import java.util.List;

@Embeddable
public class MerchantSettings {

    @Column
    private String logoFileLocation;
    @ElementCollection
    private List<MandateFrequency> selectedFrequencies;

    public MerchantSettings() {}

    public String getLogoFileLocation() {
        return logoFileLocation;
    }

    public void setLogoFileLocation(String logoFileLocation) {
        this.logoFileLocation = logoFileLocation;
    }

    public List<MandateFrequency> getSelectedFrequencies() {
        return selectedFrequencies;
    }

    public void setSelectedFrequencies(List<MandateFrequency> selectedFrequencies) {
        this.selectedFrequencies = selectedFrequencies;
    }
}
