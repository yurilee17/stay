package com.care.stay.hotel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HotelController {
	@Autowired private HotelService hservice;

	
	@RequestMapping("hotellist")
	public String hotellist() {
		return "hotel/hotellist";
	}
	
	@RequestMapping("hotelpage")
	public String hotelpage() {
		return "hotel/hotelpage";
	}
	
	@RequestMapping("hotel")
	public String motel(Model model) {
		hservice.hotelform(model);
		return "board/hotel";
	}
	
//	@RequestMapping("stayInfo")
//	public String stayInfo(
//			@RequestParam(value="currentPage", required = false)String cp, 
//			Model model) {
//		hservice.stayInfo(cp, model);
//		return "admin/stayInfo";
//	}
	


}
