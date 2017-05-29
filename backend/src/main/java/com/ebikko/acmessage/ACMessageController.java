package com.ebikko.acmessage;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = ACMessageController.AC_MESSAGE_URL)
public class ACMessageController {

    public static final String AC_MESSAGE_URL = "/acmessage";

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<String> processACMessage(@ModelAttribute FpxACMessageDTO fpxACMessageDTO) {


        return new ResponseEntity<>("OK", HttpStatus.OK);
    }
}
