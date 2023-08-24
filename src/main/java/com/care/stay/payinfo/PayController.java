package com.care.stay.payinfo;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class PayController {
	@Autowired private HttpSession session;
	@Autowired private PayService payservice;

    @PostMapping("/reservation/paymentComplete")
    public ResponseEntity<String> paymentComplete(@RequestBody PayInfoDTO payinfoDto) {
        try {
            payservice.payInfoProc(payinfoDto);
            return ResponseEntity.ok("결제 정보가 성공적으로 저장되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("결제 정보 저장 중 오류가 발생하였습니다.");
        }
    }
} 

