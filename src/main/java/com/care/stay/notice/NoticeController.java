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
//	@Autowired private HttpSession session;
	
//	private final NoticeRepository noticeRepository;
//
//    @Autowired
//    public NoticeController(NoticeRepository noticeRepository) {
//        this.noticeRepository = noticeRepository;
//    }

	
	@RequestMapping("/noticeForm")
    public String noticeForm(
    		@RequestParam(value = "currentPage", required = false) String cp,
                             Model model) {
        System.out.println("호출되는거야?");
        service.noticeForm(cp, model);
        return "notice/noticeForm";
    }
	
//	@RequestMapping("noticeForm")
//	 public String noticeForm(Model model) {
//	        List<NoticeDTO> list = new ArrayList<>();
//
//	        // 데이터베이스에서 공지사항 목록을 가져와서 noticeItems에 추가하는 로직을 구현
//	        // 예시로 여기서는 임의의 데이터를 추가
//	        list.add(new NoticeDTO());
//	        list.add(new NoticeDTO());
//	        // ...
//
//	        model.addAttribute("result", list);
//	        return "notice/noticeForm"; // 반환되는 문자열은 JSP 파일의 이름입니다.
//	    }
}
	
//	@RequestMapping("noticeContent")
//	public String noticeContent(
//			@RequestParam(value="no", required = false = false)String n, Model model) {
//		NoticeDTO notice = service.noticeContent(n);
//		if(notice == null) {
//		System.out.println("noticContent 공지사항 번호 : " + n);
//		return "redirect:noticeForm";
//		}
//	model.addAttribute("notice", notice);
//	return "notice/noticeContent";
//		}
//	
	
	
//}