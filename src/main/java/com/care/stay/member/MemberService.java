package com.care.stay.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.stay.member.MemberDTO;
import com.care.stay.member.MemberMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	@Autowired private HttpSession session;
	
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
}