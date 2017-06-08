package com.ebikko.merchant.web;

import com.ebikko.mandate.model.MandateFrequency;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.service.MerchantService;
import com.ebikko.merchant.model.MerchantSettings;
import com.ebikko.merchant.service.StorageService;
import com.google.common.base.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Collection;

import static com.ebikko.mandate.web.MerchantController.MERCHANT_URL;
import static com.google.common.collect.Collections2.transform;
import static com.google.common.collect.Lists.newArrayList;

@RestController
@RequestMapping(MERCHANT_URL + "/{merchantId}/settings")
public class MerchantSettingsController {

    private final MerchantService merchantService;
    private final StorageService storageService;

    @Autowired
    public MerchantSettingsController(MerchantService merchantService, StorageService storageService) {
        this.merchantService = merchantService;
        this.storageService = storageService;
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity updateSettings(@PathVariable("merchantId") Long merchantId,
                                         @RequestParam(value = "logo", required = false) MultipartFile logo,
                                         HttpServletRequest request) throws IOException {

        Merchant merchant = merchantService.getMerchant(merchantId);

        Collection<MandateFrequency> frequencyList = getMandateFrequencies(request);
        merchant.getMerchantSettings().setSelectedFrequencies(newArrayList(frequencyList));

        if (logo != null) {
            String logoFileLocation = storageService.replaceMerchantLogo(merchant, logo);
            if (merchant.getMerchantSettings() == null) {
                merchant.setMerchantSettings(new MerchantSettings());
            }
            merchant.getMerchantSettings().setLogoFileLocation(logoFileLocation);
        }

        merchantService.save(merchant);
        return new ResponseEntity(HttpStatus.OK);
    }

    private Collection<MandateFrequency> getMandateFrequencies(HttpServletRequest request) {
        String[] frequencies = request.getParameterValues("frequency");
        return transform(newArrayList(frequencies), new Function<String, MandateFrequency>() {
            public MandateFrequency apply(String input) {
                return MandateFrequency.valueOf(input);
            }
        });
    }
}
