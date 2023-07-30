package com.care.stay.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelService;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminStayController {
	@Autowired private AdminStayService service;
	@Autowired private MotelService mservice;
	@Autowired private HttpSession session;
	
	@GetMapping("stayregister")
	public String stayregister() {
		return "admin/stayregister";
	}

	@PostMapping("stayregisterProc")
	public String stayregisterProc(MotelDTO motel, String confirm) {
		String result = service.stayregisterProc(motel, confirm);
		if(result.equals("숙소 정보가 등록되었습니다.")) {
			return "redirect:admin/stayregister";
		}
		return "admin/stayregister";
	}
	

}
