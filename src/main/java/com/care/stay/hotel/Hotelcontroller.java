
package com.care.stay.hotel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import jakarta.servlet.http.HttpSession;

@Controller
public class Hotelcontroller {
	@Autowired private HotelService service;
	@Autowired private HttpSession session;

	// 아무것도 지정하지 않았을때 
	//	@RequestMapping("hotellist")
	//	public String hotellist() {
	//				
	//		return "hotel/hotellist";
	//	}

	
	  //1차시도! 
	  @RequestMapping("hotellist") 
	  	public String hotellist(
	  
	  @RequestParam(value="currentPage", required = false)String cp, String
	  mainMenu, String subMenu, Model model) {
	  
	  System.out.println("hotellist나오는지 알려주세요");
	  
	  service.hotellist(cp,model); 
	  	return "hotel/hotellist"; 
	  	}
	  
	  
	  @RequestMapping("Main") 
	  	public String Main(
			  
			  @RequestParam(value="currentPage", required = false)String cp, String mainMenu, 
			  	String subMenu, Model model) {
			  
			  System.out.println("Main1_1나오는지 알려주세요");
			  
			  service.Main1_1(cp,model); 
			  	return "hotel/hotellist";
//			  	return "redirect:hotellistMain1_1"; 
			  	}
	 
	 
	  
	  
	  
	//2차시도!!
	/*
	 * @RequestMapping("hotellist") public String hotellist(
	 * 
	 * @RequestParam(value="currentPage", required = false)String cp, String
	 * mainMenu, String subMenu, Model model) { service.hotellist(cp, mainMenu,
	 * subMenu, model); return "hotel/hotellist"; }
	 */
	
	
	
	  
	@RequestMapping("hotelpage")
	public String hotelpage() {
		return "hotel/hotelpage";
	}
	
	

}
