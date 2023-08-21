
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
	@Autowired private HotelService service;
	@Autowired private HttpSession session;
	
	  //hotellist 첫화면 
	  @RequestMapping("hotellist") 
	  	public String hotellist(
	  
	  @RequestParam(value="currentPage", required = false)String cp, Model model) {
	  
	  System.out.println("hotellist나오는지 알려주세요");
	  
	  service.hotellist(cp,model); 
	  	return "hotel/hotellist"; 
	  	}
	  
	  // 뭔가를 선택했을 때 나오는 화면 
	  @RequestMapping("Main") 
	  	public String MainCheck(
			  
			  @RequestParam(value="currentPage", required = false)  String cp, 
	  		  @RequestParam(value="hdetailregion" , required = false) String selectedText, 
	  		  @RequestParam(value="checkindate", required = false) String checkindate,
	  		  @RequestParam(value="checkoutdate", required = false) String checkoutdate,
	  		/*  @RequestParam(value="htype", required = false) List<String> htype,
	  		  @RequestParam(value="hbedtype", required = false) List<String> hbedtype,
	  		  @RequestParam(value="hcomfort", required = false) List<String> hcomfort, */
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
		  		
		  	
		        
		  		
//		  	   if (checkindate != null || htype != null || hbedtype != null || hcomfort != null ) {
		  		   	
//		  		   service.MainCheck(selectedText, checkindate, checkoutdate, htype, hbedtype, hcomfort, hpeople, cp ,model); 		  		   	
//		  	    } 
//		  	   else if(selectedText != null || checkindate != null && checkoutdate != null ) {
//		  	        service.Main(selectedText, checkindate, checkoutdate, cp ,model);
//		  	    }
		  	   
		  	  //아래내용을 변경하기 
			   if (checkindate != null || htype != null || hbedtype != null || hcomfort != null ) {
		  		   	
		  		   service.MainCheck(selectedText, htype, hbedtype, hcomfort, hpeople, cp ,model); 		  		   	
		  	    } 
		  	   else if(selectedText != null ) {
		  	        service.Main(selectedText, cp ,model);
		  	    }   
		  		
		  		
		/*  	if(selectedText != null) {
		  			service.Main(selectedText, cp ,model);
		  		}
		  		if(htype != null) {
		  			service.typeList(selectedText,htype,cp ,model);
		  		}
		  		if(hbedtype != null) {
		  			service.bedtypeList(selectedText,hbedtype,cp ,model);
		  		}
		  		if(hcomfort != null) {
		  			service.comfortList(selectedText,hcomfort,cp ,model);
		  		}
		  		if(hpeopleString != null) {
		  			service.MainCheck_hpeople(selectedText,hpeopleString,cp ,model);
		  		}
		  		*/
		  		

		  		return "hotel/hotellist";
			  	}
	
	  
	@RequestMapping("hotelpage")
	public String hotelpage() {
		return "hotel/hotelpage";
	}
	
	

}
