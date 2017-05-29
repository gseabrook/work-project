package com.ebikko.banks;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.google.common.collect.Lists.newArrayList;

public class FpxBCMessageDTO {

    private String fpx_msgType;
    private String fpx_msgToken;
    private String fpx_sellerExId;
    private List<BEMessageBank> fpx_bankList;
    private String fpx_checkSum;

    public FpxBCMessageDTO(String bcMessage) {
        Map<String, String> pairs = new HashMap<>();

        while (bcMessage.length() > 0) {
            if (bcMessage.startsWith("fpx_")) {
                int idxNextKey = bcMessage.indexOf("fpx_", 1);
                String[] split;
                if (idxNextKey > -1) {
                    String sub = bcMessage.substring(0, idxNextKey - 1);
                    split = sub.split("=");
                    bcMessage = bcMessage.substring(idxNextKey);
                } else {
                    split = bcMessage.split("=");
                    bcMessage = "";
                }

                pairs.put(split[0], split[1]);
            }
        }

        this.fpx_msgType = pairs.get("fpx_msgType");
        this.fpx_msgToken = pairs.get("fpx_msgToken");
        this.fpx_sellerExId = pairs.get("fpx_sellerExId");
        this.fpx_checkSum = pairs.get("fpx_checkSum");
        this.fpx_bankList = newArrayList();
        String[] bankArray = pairs.get("fpx_bankList").split(",");
        for (String bank : bankArray) {
            String[] split = bank.split("~");
            this.fpx_bankList.add(new BEMessageBank(split[0], split[1]));
        }

    }

    public String getFpx_msgType() {
        return fpx_msgType;
    }

    public String getFpx_msgToken() {
        return fpx_msgToken;
    }

    public String getFpx_sellerExId() {
        return fpx_sellerExId;
    }

    public List<BEMessageBank> getFpx_bankList() {
        return fpx_bankList;
    }

    public String getFpx_checkSum() {
        return fpx_checkSum;
    }
}
