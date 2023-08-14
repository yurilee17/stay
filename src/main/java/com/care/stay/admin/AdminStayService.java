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
//
//	public MotelDTO stayDetailRegister(String n) {
//		int no = 0;
//
//		try {
//			no = Integer.parseInt(n);
//		} catch (Exception e) {
//			return null;
//		}
//
//		MotelDTO motel = adminStayMapper.stayContent(no);
//		if (motel == null)
//			return null;
//
//		return motel;
//	}



//	public String stayregisterProc(MotelDTO motel, String confirm) {
//		if(motel.getMname() == null || motel.getMname().isEmpty()) {
//			return "숙소 이름을 입력하세요.";
//		}
//		if(motel.getMregion() == null || motel.getMregion().isEmpty()) {
//			return "지역을 선택하세요.";
//		}
//		if(motel.getMdetailregion() == null || motel.getMdetailregion().isEmpty()) {
//			return "세부지역을 선택하세요.";
//		}		
//		if(motel.getMaddress() == null || motel.getMaddress().isEmpty()) {
//			return "주소를 입력하세요.";
//		}
//		if(motel.getMdetailAddress() == null || motel.getMdetailAddress().isEmpty()) {
//			return "상세주소를 입력하세요.";
//		}
//		
//		motel.setFileName("");
//		MultipartFile file = multi.getFile("uploadImage");
//		String fileName = file.getOriginalFilename();
//		if(file.getSize() != 0) {
//			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
//			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
//			Calendar cal = Calendar.getInstance();
//			fileName = sdf.format(cal.getTime()) + fileName;
//			board.setFileName(fileName);
//			
//			// 업로드 파일 저장 경로
//			String fileLocation = "C:\\javas\\upload\\";
//			File save = new File(fileLocation + fileName);
//			
//			try {
//				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
//				file.transferTo(save);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		return null;
//	}

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

}
