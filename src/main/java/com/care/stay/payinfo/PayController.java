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

	@PostMapping("paymentComplete")
	public ResponseEntity<String> paymentComplete(@RequestBody PayInfoDTO payInfoDTO) {
        payservice.payInfoProc(payInfoDTO);
        return ResponseEntity.ok("Payment data saved successfully.");
    }
	
	
	
	
	
} 

