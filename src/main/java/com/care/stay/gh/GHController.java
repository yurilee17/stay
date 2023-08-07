package com.care.stay.gh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class GHController {
	@Autowired private GHService gservice;
	@Autowired private HttpSession session;
	
	@RequestMapping("guesthouse")
	public String guesthouse(Model model) {
		gservice.guesthouseform(model);
		return "board/guesthouse";
	}
	
}
