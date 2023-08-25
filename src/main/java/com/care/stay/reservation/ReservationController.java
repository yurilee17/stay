package com.care.stay.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

        @RequestParam(value = "no", required = false) String n,
        @RequestParam(value = "stayType", required = false) String stayType,
        @RequestParam(value = "mroomcode", required = false) String mroomcode,
        @RequestParam(value = "hroomcode", required = false) String hroomcode,
        @RequestParam(value = "proomcode", required = false) String proomcode,
        @RequestParam(value = "groomcode", required = false) String groomcode,
        @RequestParam(value = "croomcode", required = false) String croomcode,
        Model model) {

		String loginId = (String) session.getAttribute("id");
		
		if (loginId == null || loginId.isEmpty()) {
			return "redirect:login";
		} 

		
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
	        @RequestParam(value = "no", required = false) String n,
	        @RequestParam(value = "stayType", required = false) String stayType,
	        @RequestParam(value = "mroomcode", required = false) String mroomcode,
	        Model model) {

		String loginId = (String) session.getAttribute("id");
		
		if (loginId == null || loginId.isEmpty()) {
			return "redirect:login";
		} 

        model.addAttribute("stayType", stayType);
        rservice.stayAndRoomInfo(stayType, n, mroomcode, model);
        rservice.getmroomCode(mroomcode, model);

		return "reservation/daesilReservation";
	}	

	@PostMapping("reservationProc")
	public String stayreservationProc(HttpServletRequest request) {
		rservice.stayReservationProc(request);
		return "redirect:reservationList";
	}

}
