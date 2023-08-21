package com.care.stay.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.stay.camping.CampingDTO;
import com.care.stay.camping.CampingRoomDTO;
import com.care.stay.camping.CampingService;
import com.care.stay.gh.GHDTO;
import com.care.stay.gh.GHRoomDTO;
import com.care.stay.gh.GHService;
import com.care.stay.hotel.HotelDTO;
import com.care.stay.hotel.HotelMapper;
import com.care.stay.hotel.HotelRoomDTO;
import com.care.stay.hotel.HotelService;
import com.care.stay.member.MemberMapper;
import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelRoomDTO;
import com.care.stay.motel.MotelService;
import com.care.stay.pension.PensionDTO;
import com.care.stay.pension.PensionRoomDTO;
import com.care.stay.pension.PensionService;
import com.care.stay.motel.MotelService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class ReservationService {
	@Autowired private MemberMapper memberMapper;
	@Autowired private HotelMapper hotelMapper;
	@Autowired private ReservationMapper reservationMapper;
	@Autowired private HttpSession session;

	@Autowired private MotelService mservice;
	@Autowired private HotelService hservice;	
	@Autowired private PensionService pservice;	
	@Autowired private GHService gservice;
	@Autowired private CampingService cservice;

	public void stayAndRoomInfo(String stayType, String n, String rc, Model model) {
		if("motel".equals(stayType)) {
			MotelDTO motel = mservice.stayContent(n);
			MotelRoomDTO motelroom = mservice.roomContent(rc);
			model.addAttribute("motel", motel);
	        model.addAttribute("motelroom", motelroom);

		} else if("hotel".equals(stayType)) {
			HotelDTO hotel = hservice.stayContent(n);
			HotelRoomDTO hotelroom = hservice.roomContent(rc);
			model.addAttribute("hotel", hotel);
	        model.addAttribute("hotelroom", hotelroom);			
		} 
		else if("pension".equals(stayType)) {
			PensionDTO pension = pservice.stayContent(n);
			PensionRoomDTO pensionroom = pservice.roomContent(rc);
			model.addAttribute("pension", pension);
	        model.addAttribute("pensionroom", pensionroom);			
		} else if("gh".equals(stayType)) {
			GHDTO gh = gservice.stayContent(n);
			GHRoomDTO ghroom = gservice.roomContent(rc);
			model.addAttribute("gh", gh);
	        model.addAttribute("ghroom", ghroom);			
		} else if("camping".equals(stayType)) {
			CampingDTO camping = cservice.stayContent(n);
			CampingRoomDTO campingroom = cservice.roomContent(rc);
			model.addAttribute("camping", camping);
	        model.addAttribute("campingroom", camping);			
		}
	}

    public void getmroomCode(String mroomcode, Model model) {
        model.addAttribute("roomCode", mroomcode);
    }
    
    public void gethroomCode(String hroomcode, Model model) {
    	model.addAttribute("roomCode", hroomcode);
    }
    
    public void getcroomCode(String croomcode, Model model) {
    	model.addAttribute("roomCode", croomcode);
    }
    
    public void getgroomCode(String groomcode, Model model) {
    	model.addAttribute("roomCode", groomcode);
    }
    
    public void getproomCode(String proomcode, Model model) {
    	model.addAttribute("roomCode", proomcode);
    }
    
    
    public String stayReservationProc(HttpServletRequest request) {
    	ReservationDTO reservation = new ReservationDTO();
    	reservation.setStayno(Integer.parseInt(request.getParameter("stayno")));
    	reservation.setStayname(request.getParameter("stayname"));
    	reservation.setRoomname(request.getParameter("roomname"));
    	reservation.setCode(request.getParameter("code"));
    	reservation.setRoomcode(Integer.parseInt(request.getParameter("roomcode")));
    	reservation.setRoomimage(request.getParameter("roomimage"));
    	reservation.setCheckindate(request.getParameter("checkindate"));
    	reservation.setCheckoutdate(request.getParameter("checkoutdate"));
    	reservation.setCheckintime(request.getParameter("checkintime"));
    	reservation.setCheckouttime(request.getParameter("checkouttime"));
    	reservation.setId(request.getParameter("id"));
    	reservation.setName(request.getParameter("name"));
    	reservation.setPrice(Integer.parseInt(request.getParameter("price")));
    	reservation.setPaymethod(request.getParameter("paymethod"));
    	reservation.setStatus(request.getParameter("status"));
    	
    	reservationMapper.reservationProc(reservation);
    	
//    	if("motel".equals(stayType)) {
//    		
//    	} else if("hotel".equals(stayType)) {
//    		
//
//    	} else if("pension".equals(stayType)) {  
//    		
//    		
//    	} else if("gh".equals(stayType)) {  
//    		
//    		
//    	} else if("camping".equals(stayType)) {  
//    
//    	}
    	
    	
    	return "예약 DB 등록 완료";
    	
		}
}
