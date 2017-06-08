package com.ebikko.merchant.model;

import org.springframework.web.multipart.MultipartFile;

public class MerchantSettingsDTO {

    private MultipartFile logo;

    public MerchantSettingsDTO() {
    }

    public void setLogo(MultipartFile logo) {
        this.logo = logo;
    }

    public MultipartFile getLogo() {
        return logo;
    }
}
