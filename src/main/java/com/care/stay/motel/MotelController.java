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
    public String motelsList(
    		@RequestParam(value="currentPage", required = false)String cp, Model model) {
//        List<MotelDTO> motelsWithMinPrices = mservice.getAllMotelsWithMinPrices();
//        model.addAttribute("motels", motelsWithMinPrices);
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
	
	@RequestMapping("Motel")
	public String MainCheck(
			@RequestParam(value="currentPage", required = false)String cp,
			@RequestParam(value="mdetailregion", required = false)String selectedText,
			@RequestParam(value="checkindate", required = false)String checkindate,
			@RequestParam(value="checkoutdate", required = false)String checkoutdate,
			@RequestParam(value="moption", required = false)String moption,
			@RequestParam(value="mpeople", required = false)String mpeople, Model model) {
		
		mservice.getAllHotelsWithMinPrices();
		
		if (moption != null) {
			mservice.MainCheck(selectedText, checkindate, checkoutdate, moption, mpeople, cp, model);
		} else {
			mservice.Main(selectedText, cp, model);
		}
		
		return "motel/motellist";
	}
		  
		
}
