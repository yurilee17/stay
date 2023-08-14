package com.care.stay.camping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
