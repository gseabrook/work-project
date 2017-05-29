package com.ebikko.banks;

public class BEMessageBank {

    private String bankId;
    private String bankStatus;

    public BEMessageBank(String bankId, String bankStatus) {
        this.bankId = bankId;
        this.bankStatus = bankStatus;
    }

    public String getBankId() {
        return bankId;
    }

    public String getBankStatus() {
        return bankStatus;
    }
}
