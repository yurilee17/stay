package com.care.stay.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.stay.hotel.HotelDTO;
import com.care.stay.hotel.HotelRoomDTO;
import com.care.stay.hotel.HotelService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired private HttpSession session;
	@Autowired private HotelService hservice;

	@RequestMapping("stayReservation")
	public String stayReservation(
			/*임시로 연결만 해놓은거라 정보 없이도 넘어갈 수 있게*/
			@RequestParam(value="no", required = false)String n,
			@RequestParam(value="stayType", required = false)String stayType,
			@RequestParam(value="hroomcode", required = false)String rc,
			@RequestParam(value="hprice", required = false)String price,
			/*여기에 선택된 체크인날짜, 체크아웃날짜도 숙소리스트에서 추가로 불러올것*/
			Model model) {
		/*

		String loginId = (String) session.getAttribute("id");
		
		if (loginId == null || loginId.isEmpty()) {
			return "redirect:login";
		} 
		*/
		System.out.println("");
		System.out.println(rc + "는 객실 번호입니다.");
		
		HotelDTO hotel = hservice.stayContent(n);
		HotelRoomDTO hotelroom = hservice.stayReservation(rc);
		
		model.addAttribute("stayType", stayType);
		model.addAttribute("hotel", hotel);
		model.addAttribute("hotelroom", hotelroom);
		
		
		
		return "reservation/stayReservation";
	}
	
	
	
	@RequestMapping("paymentPractice")
	public String paymentPractice() {
		return "reservation/paymentPractice";
	}
	
	
	@GetMapping("paymentComplete")
	public String paymentComplete() {
		return "reservation/paymentComplete";
	}
}
