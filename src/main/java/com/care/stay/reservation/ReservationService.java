package com.care.stay.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.stay.member.MemberMapper;
import jakarta.servlet.http.HttpSession;

@Service
public class ReservationService {
	@Autowired private MemberMapper memberMapper;
	@Autowired private HttpSession session;

}
