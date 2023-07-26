package com.care.stay.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("index")
	public String index() {
		return "member/index";
	}
	
	@RequestMapping("notice")
	public String notice() {
		return "board/notice";
	}
	
	
	@RequestMapping("header")
	public String header() {
		return "default/header";
	}
	
	@RequestMapping("footer")
	public String footer() {
		return "default/footer";
	}
	
	@RequestMapping("main")
	public String main() {
		return "default/main";
	}

}
