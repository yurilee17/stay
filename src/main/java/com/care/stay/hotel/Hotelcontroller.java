package com.care.stay.hotel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Hotelcontroller {

	@RequestMapping("hotellist")
	public String index() {
		return "hotel/hotellist";
	}
	
	@RequestMapping("hotellistT")
	public String index1() {
		return "hotel/hotellistT";
	}
	@RequestMapping("hotellistT2")
	public String index2() {
		return "hotel/hotellistT2";
	}

}
