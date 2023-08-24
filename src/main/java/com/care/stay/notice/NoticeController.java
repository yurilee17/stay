package com.care.stay.notice;

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
public class NoticeController {
	@Autowired private NoticeService service;
	
	@RequestMapping("/noticeForm")
    public String noticeForm(
    		@RequestParam(value = "currentPage", required = false) String cp,
                             Model model) {
        service.noticeForm(cp, model);
        return "notice/noticeForm";
    }

}