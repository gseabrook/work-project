package com.ebikko.merchant.web;

import com.ebikko.mandate.model.ErrorResponse;
import com.ebikko.mandate.model.MandateFrequency;
import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.service.MerchantService;
import com.ebikko.merchant.model.MerchantSettings;
import com.ebikko.merchant.service.StorageService;
import com.google.common.base.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Collection;
import java.util.Set;

import static com.ebikko.mandate.web.MerchantController.MERCHANT_URL;
import static com.google.common.collect.Collections2.transform;
import static com.google.common.collect.Lists.newArrayList;
import static com.google.common.collect.Sets.newHashSet;
import static org.springframework.http.HttpStatus.UNPROCESSABLE_ENTITY;

/**
 * Usually all the request parameters are bound to an object, but because we are also sending a file,
 * that isn't possible and we have to specify the parameters individually
 */
@RestController
@RequestMapping(MERCHANT_URL + "/{merchantId}/settings")
public class MerchantSettingsController {

    private final MerchantService merchantService;
    private final StorageService storageService;
    private final int logoHeight;
    private final int logoWidth;

    @Autowired
    public MerchantSettingsController(MerchantService merchantService, StorageService storageService,
                                      @Value("${max.logo.height:320}") int logoHeight, @Value("${max.logo.width:320}") int logoWidth) {
        this.merchantService = merchantService;
        this.storageService = storageService;
        this.logoHeight = logoHeight;
        this.logoWidth = logoWidth;
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity updateSettings(@PathVariable("merchantId") Long merchantId,
                                         @RequestParam(value = "logo", required = false) MultipartFile logo,
                                         HttpServletRequest request) throws IOException {

        Merchant merchant = merchantService.getMerchant(merchantId);

        Collection<MandateFrequency> frequencyList = getMandateFrequencies(request);
        merchant.getMerchantSettings().setSelectedFrequencies(newArrayList(frequencyList));

        String[] purposeOfPayments = request.getParameterValues("purposeOfPayment");
        Set<String> purposesOfPayment = newHashSet(purposeOfPayments == null ? new String[0] : purposeOfPayments);
        merchant.getMerchantSettings().setPurposeOfPayments(purposesOfPayment);

        if (logo != null) {
            BufferedImage image = ImageIO.read(logo.getInputStream());
            if (image.getHeight() > logoHeight || image.getWidth() > logoWidth) {
                return new ResponseEntity(new ErrorResponse("logo", logo, "Logo must be smaller than 320px x 320px"), UNPROCESSABLE_ENTITY);
            }
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
