
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
	  		  @RequestParam(value="htype", required = false) String htype,
	  		  @RequestParam(value="hbedtype", required = false) String hbedtype,
	  		  @RequestParam(value="hcomfort", required = false) String hcomfort,
	  		  @RequestParam(value="hpeople", required = false) String hpeople, Model model)
	  {
		  		
		  		System.out.println("selectedText: " + selectedText);
		  		System.out.println("htype: " + htype);
		  		System.out.println("hbedtype: " + hbedtype);
		  		System.out.println("hcomfort: " + hcomfort);
		  		System.out.println("hpeople: " + hpeople);
		  		
		  		
		  	   if (htype != null || hbedtype != null || hcomfort != null  || hpeople != null ) {
		  	      
		  		   	service.MainCheck(selectedText, htype, hbedtype, hcomfort, hpeople, cp ,model); 
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
