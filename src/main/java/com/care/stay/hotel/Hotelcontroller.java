
package com.care.stay.hotel;

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
	@Autowired private HotelService service;
	@Autowired private HttpSession session;

	// 아무것도 지정하지 않았을때 
	//	@RequestMapping("hotellist")
	//	public String hotellist() {
	//				
	//		return "hotel/hotellist";
	//	}

	
	  //hotellist 첫화면 
	  @RequestMapping("hotellist") 
	  	public String hotellist(
	  
	  @RequestParam(value="currentPage", required = false)String cp, Model model) {
	  
	  System.out.println("hotellist나오는지 알려주세요");
	  
	  service.hotellist(cp,model); 
	  	return "hotel/hotellist"; 
	  	}
	  
	  
	  //hotellist 지역선택 
		/*
		 * @RequestMapping("Main") public String Main(
		 * 
		 * @RequestParam(value="currentPage", required = false) String cp,
		 * 
		 * @RequestParam(value="hdetailregion" , required = false) String selectedText,
		 * Model model) {
		 * 
		 * System.out.println("currentPage:" + cp); System.out.println("selectedText: "
		 * + selectedText);
		 * 
		 * service.Main(selectedText, cp ,model);
		 * 
		 * return "hotel/hotellist"; }
		 */
	  
	  
	  @RequestMapping("Main") 
	  	public String MainCheck(
			  
			  @RequestParam(value="currentPage", required = false)  String cp, 
	  		  @RequestParam(value="hdetailregion" , required = false) String selectedText, 
	  		  @RequestParam(value="htype ", required = false) String selectedValues1,
	  		  @RequestParam(value="hbedtype ", required = false) String selectedValues2,
	  		  @RequestParam(value="hcomfort ", required = false) String selectedValues3,
	  		  @RequestParam(value="hpeople ", required = false) int personCount,Model model)
	  {
		  		
		  		System.out.println("selectedText: " + selectedText);
		  		System.out.println("htype: " + selectedValues1);
		  		System.out.println("hbedtype: " + selectedValues2);
		  		System.out.println("hcomfort: " + selectedValues3);
		  		System.out.println("hpeople: " + personCount);
		  		
		  		
		  	   if (selectedValues1 != null || selectedValues2 != null || selectedValues3 != null ) {
		  	      
		  		   	service.MainCheck(selectedText, selectedValues1, selectedValues2, selectedValues3, personCount, cp ,model); 
		  	    } else {
		  	        service.Main(selectedText, cp ,model);
		  	    }
		  		return "hotel/hotellist";
			  	}
	
	  
	@RequestMapping("hotelpage")
	public String hotelpage() {
		return "hotel/hotelpage";
	}
	
	

}
