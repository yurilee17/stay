package com.care.stay.inquiry;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.boot.board.BoardService;

import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {
	@Autowired private InquiryService service;
	@Autowired private HttpSession session;
	
	@RequestMapping("/inquiryForm")
    public String inquiryForm(
    		@RequestParam(value = "currentPage", required = false) String cp,
                             Model model) {
        System.out.println("호출됩니다.");
        service.inquiryForm(cp, model);
        return "inquiry/inquiryForm";
    }
	
	@GetMapping("inquiryForm")
	public String inquiryForm() {
		String id = (String)session.getAttribute("id");
		if(id == null || id.isEmpty()) {
			return"redirection:login";
		}
		return"inquiry/inquiryForm";
	}
	
	@PostMapping("inquiryForm")
	public String inquiryForm(Model model, MultipartHttpServletRequest multi) {
		String msg = service.inquiryForm(multi);;
		if(msg.equals("게시글 작성 완료")) {
			
		}
		return "redirect:inquiryForm";
		
	}
}
	
