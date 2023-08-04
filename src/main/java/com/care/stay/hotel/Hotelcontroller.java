package com.care.stay.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Hotelcontroller {

	
	@RequestMapping("hotellist")
	public String hotellist() {
				
		return "hotel/hotellist";
	}
	
	@RequestMapping("hotelpage")
	public String hotelpage() {
		return "hotel/hotelpage";
	}
	
	


}
