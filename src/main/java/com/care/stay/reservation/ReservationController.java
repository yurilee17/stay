package com.care.stay.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.stay.hotel.HotelDTO;
import com.care.stay.hotel.HotelRoomDTO;
import com.care.stay.hotel.HotelService;
import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelRoomDTO;
import com.care.stay.motel.MotelService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired private HttpSession session;
	@Autowired private HotelService hservice;
	@Autowired private MotelService mservice;
	@Autowired private ReservationService rservice;

	@RequestMapping("stayReservation")
	public String stayReservation(
//			/*임시로 연결만 해놓은거라 정보 없이도 넘어갈 수 있게*/
//			@RequestParam(value="no", required = false)String n,
//			@RequestParam(value="stayType", required = false)String stayType,
//			@RequestParam(value="hroomcode", required = false)String rc,
//			@RequestParam(value="hprice", required = false)String price,
//			/*여기에 선택된 체크인날짜, 체크아웃날짜도 숙소리스트에서 추가로 불러올것*/
//			Model model) {
//		/*
//
//		String loginId = (String) session.getAttribute("id");
//		
//		if (loginId == null || loginId.isEmpty()) {
//			return "redirect:login";
//		} 
//		*/
//		System.out.println("");
//		System.out.println(rc + "는 객실 번호입니다.");
//		
//		HotelDTO hotel = hservice.stayContent(n);
//		HotelRoomDTO hotelroom = hservice.stayReservation(rc);
//		
//		model.addAttribute("stayType", stayType);
//		model.addAttribute("hotel", hotel);
//		model.addAttribute("hotelroom", hotelroom);
//
//		return "reservation/stayReservation";
			
        @RequestParam(value = "no", required = false) String n,
        @RequestParam(value = "stayType", required = false) String stayType,
        @RequestParam(value = "mroomcode", required = false) String mroomcode,
        @RequestParam(value = "hroomcode", required = false) String hroomcode,
        @RequestParam(value = "proomcode", required = false) String proomcode,
        @RequestParam(value = "groomcode", required = false) String groomcode,
        @RequestParam(value = "croomcode", required = false) String croomcode,
        Model model) {

        model.addAttribute("stayType", stayType);

        if ("motel".equals(stayType)) {
        	rservice.stayAndRoomInfo(stayType, n, mroomcode, model);
            rservice.getmroomCode(mroomcode, model);
        } else if ("hotel".equals(stayType)) {
        	rservice.stayAndRoomInfo(stayType, n, hroomcode, model);
            rservice.gethroomCode(hroomcode, model);
        } else if ("pension".equals(stayType)) {
        	rservice.stayAndRoomInfo(stayType, n, proomcode, model);        	
            rservice.getproomCode(proomcode, model);
        } else if ("gh".equals(stayType)) {
        	rservice.stayAndRoomInfo(stayType, n, groomcode, model);
            rservice.getgroomCode(groomcode, model);
        } else if ("camping".equals(stayType)) {
        	rservice.stayAndRoomInfo(stayType, n, croomcode, model);
            rservice.getcroomCode(croomcode, model);
        }

        return "reservation/stayReservation";	
	}
	


	@RequestMapping("daesilReservation")
	public String daesilReservation(
			/*임시로 연결만 해놓은거라 정보 없이도 넘어갈 수 있게*/
	        @RequestParam(value = "no", required = false) String n,
	        @RequestParam(value = "stayType", required = false) String stayType,
	        @RequestParam(value = "mroomcode", required = false) String mroomcode,
	        Model model) {
		/*

		String loginId = (String) session.getAttribute("id");
		
		if (loginId == null || loginId.isEmpty()) {
			return "redirect:login";
		} 
		*/
		
        model.addAttribute("stayType", stayType);
        rservice.stayAndRoomInfo(stayType, n, mroomcode, model);
        rservice.getmroomCode(mroomcode, model);
        
		
//		MotelDTO motel = mservice.stayContent(n);
//		MotelRoomDTO motelroom = mservice.daesilReservation(mroomcode);
//		
//		model.addAttribute("stayType", stayType);
//		model.addAttribute("motel", motel);
//		model.addAttribute("motelroom", motelroom);

		return "reservation/daesilReservation";
	}	
	
	
	@RequestMapping("paymentPractice")
	public String paymentPractice() {
		return "reservation/paymentPractice";
	}
	
	
	@PostMapping("reservationProc")
	public String stayreservationProc(HttpServletRequest request) {
		
		rservice.stayReservationProc(request);
		
		return "reservation/paymentComplete";
	}
	
}
