package com.care.stay.motel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpSession;

@Controller
public class MotelController {
	@Autowired private MotelService mservice;
	@Autowired private HttpSession session;
	
	@RequestMapping("motel")
	public String motel(Model model) {
		mservice.motelform(model);
		return "board/motel";
	}
	
	@RequestMapping("motellist")
	public String motellist(
		@RequestParam(value="currentPage", required = false)String cp, Model model) { 
		  mservice.motellist(cp, model); 
		  return "motel/motellist";  
	}
	
	@RequestMapping("motelpage")
	public String motelpage() {
		return "motel/motelpage";
	}
		  
		
}
