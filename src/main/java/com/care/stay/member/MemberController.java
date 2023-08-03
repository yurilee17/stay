package com.care.stay.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	@Autowired private HttpSession session;
	
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
	public String loginProc(MemberDTO member, Model model) {
		String result = service.loginProc(member);
		if(result.equals("admin")) {
			return "redirect:index?authority=admin";
		}else if(result.equals("로그인 성공")) {
			return "redirect:index";
		}
		model.addAttribute("alert", result);
		System.out.println(result);
		return "member/login";
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "forward:index";
	}
	
	/*문자 인증*/
	@GetMapping("phoneConfirm")
	public String phoneConfirm() {
		return "member/phoneConfirm";
	}

	@ResponseBody
	@PostMapping(value="sendMsg", produces = "text/plain; charset=utf-8")
	public String sendMsg(@RequestBody(required = false) String phone) {
		return service.sendMsg(phone);
	}
	
	@ResponseBody
	@PostMapping(value="sendDigit", produces = "text/plain; charset=utf-8")
	public String sendDigit(@RequestBody(required = false) String digit) {
		return service.sendDigit(digit);
		
	}
	

	@GetMapping("register")
	public String register() {
		return "member/register";
	}
	
	@PostMapping("regProc")
	public String regProc(MemberDTO member, Model model) {
		String nickResult = service.serchNickname(member.getNickname());
		String result = service.loginProc(member); 
		
		
		if(nickResult.equals("닉네임 중복")) {
			model.addAttribute("alert", nickResult);
			return "member/register";
		}else if (result.equals("로그인 성공") || result.equals("admin")) {
			model.addAttribute("alert", "아이디 중복");
			return "member/register";
		}else {
			model.addAttribute("alert", "회원가입 성공");
		}
		return "redirect:index";
	}
	/*카카오톡으로 회원가입 로그인 진입*/
	@Autowired private KakaoService kakao;
	@GetMapping("kakaoLogin")
	public String kakaoLogin(String code, Model model) {
		System.out.println("code : " + code);
		kakao.getAccessToken(code);
		MemberDTO member = kakao.getUserInfo();
		String result = service.loginProc(member);
		if(result.equals("실패")) {
			model.addAttribute("account_id",member.getId());
			System.out.println(member.getId());
			return "redirect:phoneConfirm";
		}else {
			System.out.println(member.getId());
			return "redirect:index";
		}
		
	}
	
	@GetMapping("kakaoLogout")
	public String kakaoLogout() {
		kakao.unLink();
		return "redirect:index";
	}
}
