package com.care.stay.payinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class PayService {
	@Autowired private PayMapper payMapper;
	@Autowired private HttpSession session;

	public void payInfoProc(PayInfoDTO payInfoDTO) {
		payMapper.payInfoProc(payInfoDTO);
		System.out.println("Saving payment data: " + payInfoDTO);
	}

}
