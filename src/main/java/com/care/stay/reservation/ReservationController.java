package com.care.stay.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired private HttpSession session;

	@RequestMapping("stayReservation")
	public String stayReservation(
			/*임시로 연결만 해놓은거라 정보 없이도 넘어갈 수 있게*/
			@RequestParam(value="no", required = false)String n,
			@RequestParam(value="stayType", required = false)String stayType,
			@RequestParam(value="hroomCode", required = false)String roomCode,
			@RequestParam(value="hprice", required = false)String price,
			/*여기에 선택된 체크인날짜, 체크아웃날짜도 숙소리스트에서 추가로 불러올것*/
			Model model) {
		/*

		String loginId = (String) session.getAttribute("id");
		
		if (loginId == null || loginId.isEmpty()) {
			return "redirect:login";
		} 
		*/
		return "reservation/stayReservation";
	}
	
	
}
