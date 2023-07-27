package com.care.stay.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.stay.member.MemberService;
import com.care.stay.member.MemberDTO;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	
	@RequestMapping("index")
	public String index() {
		return "member/index";
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
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("loginProc")
	public String loginProc(MemberDTO member) {
		String authority = member.getAuthority();
		System.out.println("conta" + member.getAuthority());
		System.out.println("cont" + member.getId());
		String result = service.loginProc(member);
		if(result.equals("admin")) {
			return "redirect:index?authority=admin";
		}else if(result.equals("로그인 성공")) {
			return "redirect:index";
		}
		return "member/login";
	}
	
	@RequestMapping("notice")
	public String notice() {
		return "board/notice";
	}
	
	@GetMapping("register")
	public String register() {
		return "member/register";
	}
	
}
