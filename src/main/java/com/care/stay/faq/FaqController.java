package com.care.stay.faq;

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
public class FaqController {
	@Autowired private FaqService service;

	@RequestMapping("/faqForm")
    public String faqForm(
    		@RequestParam(value = "currentPage", required = false) String cp,
                             Model model) {
        service.inquiryForm(cp, model);
        return "faq/faqForm";
    }
	
}
