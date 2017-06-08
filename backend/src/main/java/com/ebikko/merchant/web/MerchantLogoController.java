package com.ebikko.merchant.web;

import com.ebikko.mandate.model.Merchant;
import com.ebikko.mandate.model.User;
import com.ebikko.mandate.service.MerchantService;
import com.ebikko.mandate.service.UserService;
import com.ebikko.merchant.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.File;
import java.io.IOException;

import static java.nio.file.Files.readAllBytes;
import static org.springframework.http.ResponseEntity.ok;

@Controller
public class MerchantLogoController {

    private final MerchantService merchantService;
    private final StorageService storageService;
    private final UserService userService;

    @Autowired
    public MerchantLogoController(MerchantService merchantService, StorageService storageService, UserService userService) {
        this.merchantService = merchantService;
        this.storageService = storageService;
        this.userService = userService;
    }

    @RequestMapping(path = "/merchant/{merchantId}/logo", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getLogo(@PathVariable("merchantId") Long merchantId) throws IOException {
        Merchant merchant = merchantService.getMerchant(merchantId);
        return getResponseEntity(merchant);
    }

    @RequestMapping(path = "/merchant/logo", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getLogo(Authentication auth) throws IOException {
        Merchant merchant = userService.getMerchant((User) auth.getPrincipal());
        return getResponseEntity(merchant);
    }

    private ResponseEntity<byte[]> getResponseEntity(Merchant merchant) throws IOException {
        File merchantLogo = storageService.getMerchantLogo(merchant);
        return ok().contentType(MediaType.IMAGE_PNG).body(readAllBytes(merchantLogo.toPath()));
    }
}
