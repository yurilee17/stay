package com.care.stay.motel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class MotelController {
	@Autowired private MotelService service;
	@Autowired private HttpSession session;
	
	@RequestMapping("motel")
	public String motel(Model model) {
		service.motelform(model);
		return "board/motel";
	}
	
}
