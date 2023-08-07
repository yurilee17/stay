package com.care.stay.member;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private HttpSession session;

	// 로그인
	public String loginProc(MemberDTO member) {

		MemberDTO result = memberMapper.loginProc(member.getId());

		if (result != null) {
			if (result.getAuthority().equals("admin")) {
				if (member.getPassword().equals(result.getPassword())) {
					session.setAttribute("id", result.getId());
					session.setAttribute("password", result.getPassword());
					session.setAttribute("moblie", result.getMobile());
					session.setAttribute("name", result.getName());
					session.setAttribute("nickname", result.getNickname());
					session.setAttribute("authority", result.getAuthority());
					return "admin";
				}
			}
			if (result.getAuthority().equals("user")) {
				if (result.getId().contains("kakao")) {
					session.setAttribute("id", result.getId());
					session.setAttribute("moblie", result.getMobile());
					session.setAttribute("name", result.getName());
					session.setAttribute("nickname", result.getNickname());
					session.setAttribute("authority", result.getAuthority());
					return "로그인 성공";
				} else {

					BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();

					if (bpe.matches(member.getPassword(), result.getPassword())) {

						session.setAttribute("id", result.getId());
						session.setAttribute("password", result.getPassword());
						session.setAttribute("moblie", result.getMobile());
						session.setAttribute("name", result.getName());
						session.setAttribute("nickname", result.getNickname());
						session.setAttribute("authority", result.getAuthority());
						return "로그인 성공";
					}
				}
			}

		}

		return "실패";
	}

	// 로그인
	public String searchId(String id) {
		MemberDTO result = memberMapper.loginProc(id);
		if (result != null) {
			return "로그인 성공";
		}
		return "실패";
	}

	// 문자 전송
	private String content;

	@Autowired
	private PhoneConfirmService confirmService;

	public String sendMsg(String phone) {
		// 암호 생성
		Random r = new Random();
		// 1,000,000
		// 100 000 , 001234
		content = String.format("%04d", r.nextInt(10000));
		System.out.println("인증번호 : " + content);

		//
		String msg = confirmService.sendMsg(phone, "[저기어때]인증번호 [" + content + "]를 입력해주세요");
		if (msg.equals("전송 완료") == false) {
			content = "";
			return "문자 전송 실패 : 관리자에게 문의하세요.";
		}
		return msg;
	}

	// 인증번호 확인
	public String sendDigit(String digit) {

		if (digit.equals(content)) {
			return "인증 성공";
		}

		return "인증 실패";
	}

	// 닉네임 존재여부 확인
	public String serchNickname(String nickname) {
		MemberDTO result = memberMapper.serchNickname(nickname);

		if (result != null) {
			return "닉네임 중복";
		}

		return "사용 가능";
	}

	// 회원가입
	public String regProc(MemberDTO member) {
		member.setAuthority("user");

		System.out.println("회원가입 정보");
		System.out.println("[id : " + member.getId());
		System.out.println("pw : " + member.getPassword());
		System.out.println("mobile : " + member.getMobile());
		System.out.println("inckname : " + member.getNickname());
		System.out.println("auth : " + member.getAuthority());
		System.out.println("name : " + "빈 값]");
		String pw = member.getPassword();

		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		String cryptPassword = bpe.encode(member.getPassword());
		member.setPassword(cryptPassword);

		memberMapper.registerProc(member);
		// 회원가입을 위해 암호화되지 않은 pw 넣기
		member.setPassword(pw);
		return "회원 등록 완료";

	}

	// 회원 아이디로 등록된 번호 가져오기
	public String getMobile(String id) {
		MemberDTO result = memberMapper.getMobile(id);
		return result.getMobile();
	}

}