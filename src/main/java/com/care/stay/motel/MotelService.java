package com.care.stay.motel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

@Service
public class MotelService {
	@Autowired private MotelMapper motelMapper;
	@Autowired private HttpSession session;
	
	public static void motelform(Model model) {

	}

}
