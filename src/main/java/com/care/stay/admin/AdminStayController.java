package com.care.stay.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.hotel.HotelDTO;
import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminStayController {
	@Autowired private AdminStayService service;
	@Autowired private HttpSession session;
	
	@GetMapping("stayRegister")
	public String stayRegister() {
		return "admin/stayRegister";
	}
	
	@GetMapping("stayDetailRegister")
	public String stayDetailRegister() {
		return "admin/stayDetailRegister";
	}
	
	@GetMapping("stayModify")
	public String stayModify() {
		return "admin/stayModify";
	}
	
	@GetMapping("stayDetailModify")
	public String stayDetailModify() {
		return "admin/stayDetailModify";
	}
	
	@RequestMapping("stayInfo")
	public String stayInfo() {
		return "admin/stayInfo";
	}
	
	@RequestMapping("stayIndex")
	public String stayIndex() {
		return "admin/stayIndex";
	}

//	@PostMapping("stayregisterProc")
//	public String stayregisterProc(String stayType, MotelDTO motel, HotelDTO hotel, String confirm) {
//		String result;
//		if(stayType.equals("모텔")) {
//			result = service.stayregisterProc(motel, confirm);
//		} else if (stayType.equals("호텔·리조트")) {
//	        result = service.stayregisterProc(hotel, confirm);
//	    }
//		return "admin/stayregister";
//	}
	
	@PostMapping("stayregisterProc")
	public String stayregisterProc(Model model, MultipartHttpServletRequest multi) {
		String msg = service.stayregisterProc(multi);
		if(msg.equals("게시글 작성 완료"))
			return "redirect:stayInfo";
		
		model.addAttribute("msg", msg);
		return "admin/stayRegister";
	}
	
	

}
