package com.ebikko.merchant.service;

import com.ebikko.SessionService;
import com.ebikko.mandate.model.Merchant;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class StorageService {

    private final static Log log = LogFactory.getLog(StorageService.class);
    private final SessionService sessionService;

    @Autowired
    public StorageService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    public String replaceMerchantLogo(Merchant merchant, MultipartFile file) throws IOException {
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        String logoBasePath = sessionService.loadRepositoryProperty("mdd.merchant.logo.basepath");
        File f = new File(logoBasePath + "/" + merchant.getId() + "." + extension);

        log.info("Writing logo to " + f.getAbsolutePath());

        file.transferTo(f);
        return f.getAbsolutePath();
    }

    public File getMerchantLogo(Merchant merchant) {
        String logoFileLocation = merchant.getMerchantSettings().getLogoFileLocation();
        return logoFileLocation == null ? null : new File(logoFileLocation);
    }
}
