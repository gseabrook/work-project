package com.ebikko.banks;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import java.util.Map;

import static com.google.common.collect.Lists.newArrayList;

public class FpxBEMessageDTO {

    private String fpx_msgType;
    private String fpx_msgToken;
    private String fpx_sellerExId;
    private String fpx_version;
    private String fpx_checkSum;

    public FpxBEMessageDTO() {
        this.fpx_msgType = "BE";
        this.fpx_msgToken = "01";

        this.fpx_version = "7.0";
    }

    private String getChecksumSource() {
        StringBuilder source = new StringBuilder();
        source.append(this.fpx_msgToken).append("|");
        source.append(this.fpx_msgType).append("|");
        source.append(this.fpx_sellerExId).append("|");
        source.append(this.fpx_version).append("|");
        return source.toString();
    }

    public Map getMap() {
        MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
        map.put("fpx_msgType", newArrayList(this.fpx_msgType));
        map.put("fpx_msgToken", newArrayList(this.fpx_msgToken));
        map.put("fpx_version", newArrayList(this.fpx_version));
        return map;
    }
}
