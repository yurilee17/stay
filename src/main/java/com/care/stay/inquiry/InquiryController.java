package com.care.stay.inquiry;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {
	@Autowired private InquiryService service;
	
	@RequestMapping("/inquiryForm")
    public String inquiryForm(
    		@RequestParam(value = "currentPage", required = false) String cp,
                             Model model) {
        System.out.println("호출됩니다.");
        service.inquiryForm(cp, model);
        return "inquiry/inquiryForm";
    }
	

}
	
