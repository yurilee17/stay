package com.care.stay.member;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	@Autowired private HttpSession session;
	
	//로그인
	public String loginProc(MemberDTO member) {
		MemberDTO result = memberMapper.loginProc(member.getId());
		
		if(result != null) {
			if(result.getAuthority().equals("admin")) {
				if(member.getPassword().equals(result.getPassword())) {
					session.setAttribute("id", result.getId());
					session.setAttribute("password", result.getPassword());
					session.setAttribute("moblie", result.getMoblie());
					session.setAttribute("name", result.getName());
					session.setAttribute("nickname", result.getNickname());
					session.setAttribute("authority", result.getAuthority());
					return "admin";
				}
			}
			if(result.getAuthority().equals("user")) {
				BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
				
				if(bpe.matches(member.getPassword(), result.getPassword())) {
					session.setAttribute("id", result.getId());
					session.setAttribute("password", result.getPassword());
					session.setAttribute("moblie", result.getMoblie());
					session.setAttribute("name", result.getName());
					session.setAttribute("nickname", result.getNickname());
					session.setAttribute("authority", result.getAuthority());
					return "로그인 성공";
				}
			}
			
		}
		
		return "실패";
	}
	
	// 문자 전송
	private String content;
	
	@Autowired private PhoneConfirmService confirmService;
	public String sendMsg(String phone) {
		// 암호 생성
		Random r = new Random();
		// 1,000,000 
		// 100 000 , 001234
		content = String.format("%04d", r.nextInt(10000));
		System.out.println("인증번호 : " + content);
		
		// 
		String msg = confirmService.sendMsg(phone, "[저기어때]인증번호 [" + content + "]를 입력해주세요");
		if(msg.equals("전송 완료") == false) {
			content = "";
			return "문자 전송 실패 : 관리자에게 문의하세요.";
		}
		return msg;
	}
	
	//인증번호 확인
	public String sendDigit(String digit) {
		
		if(digit.equals(content)) {
			return "인증 성공";
		}
		
		return "인증 실패";
	}
	
	
}