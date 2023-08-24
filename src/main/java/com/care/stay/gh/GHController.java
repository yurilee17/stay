package com.care.stay.gh;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.stay.hotel.HotelDTO;
import com.care.stay.hotel.HotelRoomDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class GHController {
	@Autowired private GHService gservice;
	@Autowired private HttpSession session;
	
	@RequestMapping("ghlist")
	public String guesthouse(
		@RequestParam(value="currentPage", required = false)String cp, Model model) {
		return "gh/ghlist";
	}
	
	@RequestMapping("GuestHouse")
	public String GHCheck(
			@RequestParam(value="currentPage", required = false)  String cp, 
			@RequestParam(value="gdetailregion" , required = false) String selectedText, 
			@RequestParam(value="checkindate", required = false) String checkindate,
			@RequestParam(value="checkoutdate", required = false) String checkoutdate,
			@RequestParam(value="gbedtype", required = false) String gbedtype,
			@RequestParam(value="gcomfort", required = false) String gcomfort, 
			@RequestParam(value="gpeople", required = false) String gpeople ,Model model) {
			
			gservice.getAllHotelsWithMinPrices();
			if (gbedtype != null || gcomfort != null ) {
				gservice.MainCheck(selectedText, checkindate, checkoutdate, gbedtype, gcomfort, gpeople, cp ,model); 		  		   	
	  	    } else {
	  		   	gservice.Main(selectedText, cp ,model);
	  	    }
	  	   		return "gh/ghlist";
			}
	
	@RequestMapping("ghpage")
	public String ghpage(
		@RequestParam(value="no", required = false)String n,
		Model model) {
		
		GHDTO gh = gservice.stayContent(n);
		List<GHRoomDTO> ghrooms = gservice.stayRoomContent(n);

		model.addAttribute("gh", gh);
		model.addAttribute("ghrooms", ghrooms);
		return "gh/ghpage";
	}

}
