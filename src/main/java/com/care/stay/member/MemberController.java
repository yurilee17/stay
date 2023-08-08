package com.care.stay.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;

	// 메인 화면
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

	// 로그인
	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("loginProc")
	public String loginProc(MemberDTO member, Model model) {
		String result = service.loginProc(member);
		if (result.equals("admin")) {
			return "redirect:stayIndex";
		} else if (result.equals("로그인 성공")) {
			return "redirect:index";
		}
		model.addAttribute("alert", result);
		System.out.println(result);
		return "member/login";
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "forward:index";
	}

	/* ======================== 문자 인증 ======================== */
	@GetMapping("phoneConfirm")
	public String phoneConfirm() {
		return "member/phoneConfirm";
	}

	@ResponseBody
	@PostMapping(value = "sendMsg", produces = "text/plain; charset=utf-8")
	public String sendMsg(@RequestBody(required = false) String phone) {
		return service.sendMsg(phone);
	}

	@ResponseBody
	@PostMapping(value = "sendDigit", produces = "text/plain; charset=utf-8")
	public String sendDigit(@RequestBody(required = false) String digit) {
		return service.sendDigit(digit);

	}

	// 회원가입
	@GetMapping("register")
	public String register() {
		return "member/register";
	}

	// 아이디 중복 확인
	@ResponseBody
	@PostMapping(value = "sendId", produces = "text/plain; charset=utf-8")
	public String sendId(@RequestBody(required = false) String id) {
		String result = service.searchId(id);
		session.invalidate();
//		System.out.println("아이디 중복: " + result);
		return result;

	}

	// 닉네임 중복 확인
	@ResponseBody
	@PostMapping(value = "serchNickname", produces = "text/plain; charset=utf-8")
	public String serchNickname(@RequestBody(required = false) String nickname) {
//		System.out.println("닉네임 중복: " + service.serchNickname(nickname));
		return service.serchNickname(nickname);

	}

	// 회원가입 버튼 선택
	@PostMapping("regProc")
	public String regProc(MemberDTO member, String mobile, Model model) {
//		System.out.println("t " + member.getMobile());
		service.regProc(member);
		service.loginProc(member);
		model.addAttribute("alert", "회원가입 성공");
		return "redirect:index";
	}

	/* ======================== 카카오톡 ======================== */
	// 카카오톡으로 회원가입, 로그인 진입
	@Autowired
	private KakaoService kakao;

	@GetMapping("kakaoLogin")
	public String kakaoLogin(String code, Model model) {
		System.out.println("code : " + code);
		kakao.getAccessToken(code);
		MemberDTO member = kakao.getUserInfo();
		String result = service.loginProc(member);
		if (result.equals("실패")) {
			model.addAttribute("account_id", member.getId());
			System.out.println(member.getId());
			return "redirect:phoneConfirm?id=" + member.getId();
		} else {
			System.out.println(member.getId());
			return "redirect:index";
		}

	}

	// 카카오톡 연결 끊기
	@GetMapping("kakaoLogout")
	public String kakaoLogout() {
		kakao.unLink();
		return "redirect:index";
	}

	// 비밀번호 재설정
	@RequestMapping("passwdResetStart")
	public String passwdResetStart() {
		return "member/passwdResetStart";
	}

	// 비밀번호 재설정 인증번호
	@RequestMapping("passwdPhoneConfirm")
	public String passwdPhoneConfirm(String id, Model model) {
		String mobile = service.getMobile(id);
		System.out.println(mobile);
		model.addAttribute("id", id);
		model.addAttribute("mobile", mobile);
		return "member/passwdPhoneConfirm";
	}
	
	// 비밀번호 재설정 확인
	@RequestMapping("passwdResetNew")
	public String passwdResetNew(String id, Model model) {
		String mobile = service.getMobile(id);
		model.addAttribute("id", id);
		model.addAttribute("mobile", mobile);
		return "member/passwdResetNew";
	}
	

}
