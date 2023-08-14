package com.care.stay.pension;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class PensionController {
	@Autowired private PensionService pservice;
	@Autowired private HttpSession session;
	
	@RequestMapping("pension")
	public String guesthouse(Model model) {
		pservice.pensionform(model);
		return "board/pension";
	}

}
