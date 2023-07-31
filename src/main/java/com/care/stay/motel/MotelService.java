package com.care.stay.motel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.stay.admin.AdminStayMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class MotelService {
	@Autowired private AdminStayMapper adminmapper;
	@Autowired private HttpSession session;
	
	public static void motelform(Model model) {

	}
}
