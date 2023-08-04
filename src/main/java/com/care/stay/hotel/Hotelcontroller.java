
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

	
	  @RequestMapping("hotellist") 
	  public String hotellist(@RequestParam(value="currentPage", 
	  required = false)String cp, Model model) {
	  
      System.out.println("나오는지 알려주세요"); 
      
	  service.hotellist(cp, model);
	  return "hotel/hotellist";
	  }
	 
	  
	@RequestMapping("hotelpage")
	public String hotelpage() {
		return "hotel/hotelpage";
	}
	
	
//	@RequestMapping("hotellist")
//	public String hotellist() {
//				
//		return "hotel/hotellist";
//	}

}
