package com.care.stay.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationController {

	
	@RequestMapping("reservation")
	public String reservation(
			@RequestParam(value="no", required = false)String n,
			@RequestParam(value="stayType", required = false)String stayType,
			@RequestParam(value="mRoomCode", required = false)String roomCode,
			Model model) {
		return "reservation/reservation";
	}
}
