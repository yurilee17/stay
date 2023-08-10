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
	
//	@RequestMapping("stayInfo")
//	public String stayInfo(
//			@RequestParam(value="currentPage", required = false)String cp, 
//			Model model) {
//		mservice.stayInfo(cp, model);
//		return "admin/stayInfo";
//	}
	
//	@PostMapping("staydetailregisterProc")
//	public String staydetailregisterProc(Model model, MultipartHttpServletRequest multi) {
//		String msg = mservice.staydetailregisterProc(multi);
//		if(msg.equals("객실 DB 작성 완료"))
//			return "redirect:stayInfo";
//		
//		model.addAttribute("msg", msg);
//		return "admin/stayDetailRegister";
//	}
	
//	@PostMapping("stayregisterProc")
//	public String stayregisterProc(Model model, MultipartHttpServletRequest multi) {
//		String msg = mservice.stayregisterProc(multi);
//		if(msg.equals("숙소 DB 작성 완료"))
//			return "redirect:stayInfo";
//		
//		model.addAttribute("msg", msg);
//		return "admin/stayRegister";
//	}
	
}
