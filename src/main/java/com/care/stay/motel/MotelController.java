package com.care.stay.motel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpSession;

@Controller
public class MotelController {
	@Autowired private MotelService mservice;
	@Autowired private HttpSession session;
	
	@RequestMapping("motel")
	public String motel(Model model) {
		mservice.motelform(model);
		return "board/motel";
	}
	
//	@RequestMapping("motellist")
//	public String motellist(
//		@RequestParam(value="currentPage", required = false)String cp, Model model) { 
//		  mservice.motellist(cp, model); 
//		  return "motel/motellist";  
//	}
	
    @GetMapping("motellist")
    public String motelsList(Model model) {
        List<MotelDTO> motelsWithMinPrices = mservice.getAllMotelsWithMinPrices();
        model.addAttribute("motels", motelsWithMinPrices);
        return "motel/motellist";
    }
	
	@RequestMapping("motelpage")
	public String motelpage(
		@RequestParam(value="no", required = false)String n,
		Model model) {
		
		MotelDTO motel = mservice.stayContent(n);
		List<MotelRoomDTO> motelrooms = mservice.stayRoomContent(n);
		
		model.addAttribute("motel", motel);
		model.addAttribute("motelrooms", motelrooms);
		return "motel/motelpage";
	}
		  
		
}
