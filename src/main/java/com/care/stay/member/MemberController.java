package com.care.stay.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.stay.hotel.HotelService;

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
		return "redirect:index";
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

//	// 카카오톡 연결 끊기
//	@GetMapping("kakaoLogout")
//	public String kakaoLogout() {
//		kakao.unLink();
//		return "redirect:index";
//	}

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

	// 비밀번호 재설정 진행
	@PostMapping("passwdResetProc")
	public String passwdResetProc(MemberDTO member, Model model) {
		service.passwdReset(member);
		return "redirect:login";
	}

	/* ======================== 내정보 ======================== */

	@GetMapping("myPage")
	public String myPage() {
		if (session.getAttribute("id") != null) {
			return "member/myPage";
		} else {
			return "member/index";
		}
	}

	@GetMapping("myPagePwCh")
	public String myPagePwCh() {
		if (session.getAttribute("id") != null) {
			return "member/myPagePwCh";
		} else {
			return "member/index";
		}
	}

	@GetMapping("withdraw")
	public String withdraw() {
		if (session.getAttribute("id") != null) {
			return "member/withdraw";
		} else {
			return "member/index";
		}
	}

	// 닉네임 수정
	@PostMapping("updateNicknameProc")
	public String updateNicknameProc(MemberDTO member, Model model) {
		service.updateNickname(member);
		return "redirect:myPage";
	}

	// 이름 수정
	@PostMapping("updateNameProc")
	public String updateNameProc(MemberDTO member, Model model) {
		service.updateName(member);
		return "redirect:myPage";
	}

	// 휴대폰 번호 수정
	@PostMapping("updateMobileProc")
	public String updateMobile(MemberDTO member, Model model) {
		System.out.println(member.getId() + member.getMobile());
		service.updateMobile(member);
		return "redirect:myPage";
	}

	// 기존 비밀번호 확인
	@ResponseBody
	@PostMapping(value = "pwCon", produces = "text/plain; charset=utf-8")
	public String pwCon(@RequestBody Map<String, String> reqData) {
		System.out.println(reqData.get("id") + reqData.get("originalPw"));
		return service.pwCon(reqData.get("id"), reqData.get("originalPw"));

	}

	// 비밀번호 수정
	@PostMapping("newPasswdProc")
	public String newPasswdProc(MemberDTO member, Model model) {
		service.passwdReset(member);
		return "redirect:myPage";
	}

	// 탈퇴하기
	@PostMapping("withdrawProc")
	public String withdrawProc(MemberDTO member, Model model) {
		System.out.println(member.getPassword() + member.getId());
		service.withdraw(member);
		session.invalidate();
		return "redirect:login";
	}

	/* ======================== 예약 내역 ======================== */

	// 예약 내역 리스트
	@GetMapping("reservationList")
	public String reservationList(Model model) {
		if (session.getAttribute("id") != null) {
			String userId = (String) session.getAttribute("id");
			service.reservationList(userId, model);
			return "member/reservationList";
		} else {
			return "member/index";
		}
	}

	@GetMapping("reserDeleteProc")
	public String reserDeleteProc(@RequestParam int no) {
		if (session.getAttribute("id") != null) {
			service.reserDeleteProc(no);
			return "redirect:reservationList";
		} else {
			return "member/index";
		}
	}

	@GetMapping("resDetail")
	public String resDetail(@RequestParam int no, Model model) {
		if (session.getAttribute("id") != null) {
			service.resDetail(no, model);
			return "member/resDetail";
		} else {
			return "member/index";
		}
	}

	@GetMapping("resUpdate")
	public String resUpdate(@RequestParam int no, Model model) {
		System.out.println(no + "test");
		if (session.getAttribute("id") != null) {
			service.resUpdate(no);
			return "redirect:resDetail?no=" + no;
		} else {
			return "member/index";
		}
	}
	
//	@Autowired
//	private HotelService hotelService;
	// 메인 화면
	@RequestMapping("map")
	public String map(Model model) {
//		hdetailregion=강남&checkindate=2023-08-23&checkoutdate=2023-08-23
//		hotelService.Main("강남", "" ,model);  		   	
		return "default/map";
	}

}
