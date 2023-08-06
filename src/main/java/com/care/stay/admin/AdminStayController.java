package com.care.stay.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.hotel.HotelDTO;
import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelRoomDTO;
import com.care.stay.motel.MotelService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminStayController {
	@Autowired private AdminStayService service;
	@Autowired private HttpSession session;
	
	@GetMapping("stayRegister")
	public String stayRegister(Model model) {
		int nextNo = service.stayCountMotel();
		model.addAttribute("nextNo", nextNo);
		model.addAttribute("stayTypes", Arrays.asList("모텔", "호텔·리조트", "펜션", "게스트하우스", "캠핑·글램핑"));
		return "admin/stayRegister";
	}

	@GetMapping("getStayCode")
	@ResponseBody
	public String getStayCode(@RequestParam String stayType) {
	    int nextNo = service.getStayCount(stayType);
	    String prefix = stayType.equals("모텔") ? "M" :
	                    stayType.equals("호텔·리조트") ? "H" :
	                    stayType.equals("펜션") ? "P" :
	                    stayType.equals("게스트하우스") ? "G" :
	                    stayType.equals("캠핑·글램핑") ? "C" : "";
	    
	    return prefix + nextNo;
	}
	
	
//	@GetMapping("stayDetailRegister")
//	public String stayDetailRegister(
//			@RequestParam(value="no", required = false)String n, 
//			Model model) {
//		
//		MotelDTO motel = service.stayContent(n);
//		if(motel == null)
//			return "redirect:stayInfo";
//		
//		model.addAttribute("motel", motel);
//		return "admin/stayDetailRegister";
//	}
	
	@RequestMapping("stayDetailRegister")
	public String stayDetailRegister(
			@RequestParam(value="no", required = false)String n,
			Model model) {
		MotelDTO motel = service.stayContent(n);
		session.setAttribute("no", motel.getNo());
		session.setAttribute("code", motel.getMcode());
		
		if(motel == null) {
			System.out.println("motel is null");
			return "redirect:stayInfo";
		}
		model.addAttribute("motel", motel);
		return "admin/stayDetailRegister";
	}
	
	@RequestMapping("stayInfo")
	public String stayInfo(
			@RequestParam(value="currentPage", required = false)String cp, 
			Model model) {
		service.stayInfo(cp, model);
		return "admin/stayInfo";
	}
	
	
	@GetMapping("stayModify")
	public String stayModify() {
		return "admin/stayModify";
	}
	
	@GetMapping("stayDetailModify")
	public String stayDetailModify() {
		return "admin/stayDetailModify";
	}
	
	@RequestMapping("stayIndex")
	public String stayIndex() {
		return "admin/stayIndex";
	}
	
	@RequestMapping("stayContent")
	public String stayContent(
		@RequestParam(value="no", required = false)String n, 
		@RequestParam(value="mroomcode", required = false)String roomcode,
		Model model) {
		MotelDTO motel = service.stayContent(n);
		MotelRoomDTO motelroom = service.stayRoomContent(n);

		if(motel == null) {
			System.out.println("stayContent 게시글 번호 : " + n);
			return "redirect:stayRegister";
		}
		
		List<MotelRoomDTO> motelrooms = new ArrayList<>();
		
		if (motelroom != null) {
	        motelrooms.add(motelroom);
	    }
		
		
		model.addAttribute("motel", motel);
		model.addAttribute("motelrooms", motelrooms);
		return "admin/stayContent";
	}

	/* 일단은 DB 등록부터 하는게 먼저 */
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
	
	@PostMapping("staydetailregisterProc")
	public String staydetailregisterProc(Model model, MultipartHttpServletRequest multi) {
		String msg = service.staydetailregisterProc(multi);
		if(msg.equals("객실 DB 작성 완료"))
			return "redirect:stayInfo";
		
		model.addAttribute("msg", msg);
		return "admin/stayDetailRegister";
	}
	
	@PostMapping("stayregisterProc")
	public String stayregisterProc(Model model, MultipartHttpServletRequest multi) {
		String msg = service.stayregisterProc(multi);
		if(msg.equals("숙소 DB 작성 완료"))
			return "redirect:stayInfo";
		
		model.addAttribute("msg", msg);
		return "admin/stayRegister";
	}
	
	


}
