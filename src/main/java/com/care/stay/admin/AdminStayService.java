package com.care.stay.admin;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.camping.CampingMapper;
import com.care.stay.common.AdminPageService;
import com.care.stay.common.PageService;
import com.care.stay.gh.GHMapper;
import com.care.stay.hotel.HotelDTO;

import com.care.stay.hotel.HotelMapper;

import com.care.stay.member.MemberDTO;
import com.care.stay.member.MemberMapper;

import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelMapper;
import com.care.stay.motel.MotelRoomDTO;
import com.care.stay.pension.PensionMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminStayService {

	@Autowired private AdminStayMapper adminStayMapper;
	@Autowired private MemberMapper memberMapper;
	@Autowired private MotelMapper motelMapper;
	@Autowired private HotelMapper hotelMapper;
	@Autowired private PensionMapper pensionMapper;
	@Autowired private GHMapper ghMapper;
	@Autowired private CampingMapper campingMapper;
	@Autowired private HttpSession session;
	
	/* 각 테이블에 저장된 no칼럼값의 최대값 + 1을 가져오는*/
	public int getStayCount(String stayType) {
	    if (stayType.equals("motel")) {
	        return motelMapper.stayCountMotel();
	    } else if (stayType.equals("hotel")) {
	        return hotelMapper.stayCountHotel();
	    } else if (stayType.equals("pension")) {
	        return pensionMapper.stayCountPension();
	    } else if (stayType.equals("gh")) {
	        return ghMapper.stayCountGuestHouse();
	    } else if (stayType.equals("camping")) {
	        return campingMapper.stayCountCamping();
	    } else {
	        return 0;
	    }
	}

	// 회원 정보 조회
	public void stayUser(String cp, String option1Name, String option1, String option2Name, String option2,
			Model model) {
		
		if (option1Name == null) {
			option1Name = "";
		}
		if (option1 == null) {
			option1 = "";
		}
		if (option2Name == null) {
			option2Name = "";
		}
		if (option2 == null) {
			option2 = "";
		}
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}

		int pageBlock = 10; // 한 페이지에 보일 데이터의 수
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호

		ArrayList<MemberDTO> members = memberMapper.stayUser(begin, end, option1Name, option1, option2Name, option2);
		int totalCount = memberMapper.count(option1Name, option1, option2Name, option2);
		String url = "stayUser?option1Name=" + option1Name + "&option1=" + option1 + "&option2Name=" + option2Name
				+ "&option2=" + option2 + "&currentPage=";
		String result = PageService.printPageStayUser(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("members", members);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

	public void stayInfo(String cp, String stayType, String stayName, String region, String address, Model model) {
		// TODO Auto-generated method stub
		
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 10;
		int end = pageBlock * currentPage;
		int begin = end - pageBlock + 1; 
		
		if (stayType.equals("motel")) {
			ArrayList<MotelDTO> motels = motelMapper.stayInfo(begin, end);
			int totalCount = motelMapper.count();
			String url = "stayInfo?stayType=" + stayType + "&currentPage=";
			String result = AdminPageService.printPage(url, currentPage, totalCount, pageBlock, stayType);
			
			model.addAttribute("motels", motels);
			model.addAttribute("result", result);
			model.addAttribute("currentPage", currentPage);
			
		} else if (stayType.equals("hotel")) {
			ArrayList<HotelDTO> hotels = hotelMapper.stayInfo(begin, end);
			int totalCount = hotelMapper.count();
			String url = "stayInfo?currentPage=";
			String result = AdminPageService.printPage(url, currentPage, totalCount, pageBlock, stayType);
			
			model.addAttribute("hotels", hotels);
			model.addAttribute("result", result);
			model.addAttribute("currentPage", currentPage);
			
		} else if (stayType.equals("pension")) {
			
		} else if (stayType.equals("gh")) {
			
		} else if (stayType.equals("camping")) {
			
		} else {
			ArrayList<MotelDTO> motels = motelMapper.stayInfo(begin, end);
			int totalCount = motelMapper.count();
			String url = "stayInfo?stayType=" + stayType + "&currentPage=";
			String result = AdminPageService.printPage(url, currentPage, totalCount, pageBlock, stayType);
			
			model.addAttribute("motels", motels);
			model.addAttribute("result", result);
			model.addAttribute("currentPage", currentPage);			
			
		}
		
	}

}
