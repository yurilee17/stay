package com.care.stay.camping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import jakarta.servlet.http.HttpSession;

@Controller
public class CampingController {
	@Autowired private CampingService cservice;
	@Autowired private HttpSession session;
	
	@RequestMapping("camping")
	public String camping(Model model) {
		cservice.campingform(model);
		return "board/camping";
	}
	
	
	
	  // 뭔가를 선택했을 때 나오는 화면 
	  @RequestMapping("campinglist") 
	  	public String MainCheck(
	  		
	  		  @RequestParam(value="currentPage", required = false)  String cp, 
	  		  @RequestParam(value="cdetailregion" , required = false) String selectedText, 
	  		  @RequestParam(value="checkindate", required = false) String checkindate,
	  		  @RequestParam(value="checkoutdate", required = false) String checkoutdate,
	  		  @RequestParam(value="ctype", required = false) String ctype,
	  		  @RequestParam(value="ccomfort", required = false) String ccomfort, 
	  		  @RequestParam(value="cpeople", required = false) String cpeople ,Model model )
	  {
		  		
		  		System.out.println("selectedText: " + selectedText);
		  		System.out.println("ctype: " + ctype);
		  		System.out.println("ccomfort: " + ccomfort);
		  		System.out.println("cpeople: " + cpeople);
		  		System.out.println("checkindate: " + checkindate);
		  		System.out.println("checkoutdate: " + checkoutdate);
		  		
		  		cservice.getAllHotelsWithMinPrices();
		  		
		  		
		  	   if (ctype != null || ccomfort != null ) {
		  		   	
		  		 cservice.MainCheck(selectedText, checkindate, checkoutdate, ctype, ccomfort, cpeople, cp ,model); 		  		   	
		  	    } 
		  	   else {
		  		 cservice.Main(selectedText, cp ,model);
		  	    }
		  	   

		  		return "camping/campinglist";
			  	}
	
	
	
	
	@RequestMapping("campingpage")
	public String campingpage(
		@RequestParam(value="no", required = false)String n,
		Model model) {
		
		CampingDTO camping = cservice.stayContent(n);
		List<CampingRoomDTO> campingrooms = cservice.stayRoomContent(n);
	
		
		model.addAttribute("camping", camping);
		model.addAttribute("campingrooms", campingrooms);
		return "camping/campingpage";
	}
	
}
