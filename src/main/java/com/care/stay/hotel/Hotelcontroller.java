
package com.care.stay.hotel;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class Hotelcontroller {
	@Autowired private HotelService hotelService;
	@Autowired private HttpSession session;
	
	  //hotellist 첫화면 
//	  @RequestMapping("hotellist") 
//	  	public String hotellist(
//	  
//	  @RequestParam(value="currentPage", required = false)String cp, Model model) {
//	  
//	  System.out.println("hotellist나오는지 알려주세요");
//	  
//	  service.hotellist(cp,model); 
//	  	return "hotel/hotellist"; 
//	  	}
	  
/* 최저가.. */	  

//	    @RequestMapping("hotellist")
//	    public String hotelsList(Model model) {
//	        List<HotelDTO> hotels = service.getAllHotelsWithMinPrices();
//	        model.addAttribute("hotels", hotels);
//	        return "hotel/hotellist";
//	    }
	
	  @RequestMapping("hotellist") 
  	public String hotellist(
  
  @RequestParam(value="currentPage", required = false)String cp, Model model) {
	
	  System.out.println("hotellist나오는지 알려주세요");
	 
//	  hotelService.hotellist(cp,model); 
	  	return "hotel/hotellist"; 
	  	}

	  

	  
	  // 뭔가를 선택했을 때 나오는 화면 
	  @RequestMapping("Main") 
	  	public String MainCheck(
	  		
			  @RequestParam(value="currentPage", required = false)  String cp, 
	  		  @RequestParam(value="hdetailregion" , required = false) String selectedText, 
	  		  @RequestParam(value="checkindate", required = false) String checkindate,
	  		  @RequestParam(value="checkoutdate", required = false) String checkoutdate,
	  		  @RequestParam(value="htype", required = false) String htype,
	  		  @RequestParam(value="hbedtype", required = false) String hbedtype,
	  		  @RequestParam(value="hcomfort", required = false) String hcomfort, 
	  		  @RequestParam(value="hpeople", required = false) String hpeople ,Model model )
	  {
		  		
		  		System.out.println("selectedText: " + selectedText);
		  		System.out.println("htype: " + htype);
		  		System.out.println("hbedtype: " + hbedtype);
		  		System.out.println("hcomfort: " + hcomfort);
		  		System.out.println("hpeople: " + hpeople);
		  		System.out.println("checkindate: " + checkindate);
		  		System.out.println("checkoutdate: " + checkoutdate);
		  		
		  		 hotelService.getAllHotelsWithMinPrices();
		  		
		  		
		  	   if (htype != null || hbedtype != null || hcomfort != null ) {
		  		   	
		  		 hotelService.MainCheck(selectedText, checkindate, checkoutdate, htype, hbedtype, hcomfort, hpeople, cp ,model); 		  		   	
		  	    } 
		  	   else {
		  		   	hotelService.Main(selectedText, cp ,model);
		  	    }
		  	   

		  		return "hotel/hotellist";
			  	}
	
	  
			
	
			@RequestMapping("hotelpage")
			public String hotelpage(
				@RequestParam(value="no", required = false)String n,
				Model model) {
				
				HotelDTO hotel = hotelService.stayContent(n);
				List<HotelRoomDTO> hotelrooms = hotelService.stayRoomContent(n);
			
				
				model.addAttribute("hotel", hotel);
				model.addAttribute("hotelrooms", hotelrooms);
				return "hotel/hotelpage";
			}
	
	

}
