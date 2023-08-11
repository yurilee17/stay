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

import com.care.stay.common.PageService;
import com.care.stay.hotel.HotelDTO;
import com.care.stay.member.MemberDTO;
import com.care.stay.member.MemberMapper;
import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelRoomDTO;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminStayService {
	@Autowired
	private AdminStayMapper adminStayMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private HttpSession session;

	/* 숙소 DB 등록 */
	public String stayregisterProc(MultipartHttpServletRequest multi) {
		MotelDTO motel = new MotelDTO();
		motel.setMname(multi.getParameter("name"));
		motel.setMregion(multi.getParameter("region"));
		motel.setMdetailRegion(multi.getParameter("detailRegion"));
		motel.setMaddress(multi.getParameter("address"));
		motel.setMdetailAddress(multi.getParameter("detailAddress"));
		motel.setMinfo(multi.getParameter("info"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/* 밑에꺼 주석 풀면 submit가 안되고 자꾸 redirect됨 */

//		if(motel.getMcode() == null || motel.getMcode().isEmpty()) {
//			return "코드를 정확하게 입력하세요.";
//		}
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

		motel.setMimage("");
		MultipartFile file = multi.getFile("imageupload");
		String fileName = file.getOriginalFilename();
		if (file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			motel.setMimage(fileName);

			System.out.println(fileName);
			System.out.println(multi.getParameter("info"));
			System.out.println();

			// 업로드 파일 저장 경로
			String fileLocation = "C:\\javas\\upload\\";
			File save = new File(fileLocation + fileName);

			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
//		System.out.println();
//		System.out.println(motel.getMcode());
//		System.out.println(motel.getMname());
//		System.out.println(motel.getMregion());
//		System.out.println(motel.getMdetailRegion());
//		
//		System.out.println(motel.getMaddress());
//		System.out.println(motel.getMimage());
//		System.out.println(motel.getMinfo());
//		System.out.println(motel.getMdetailAddress());

		adminStayMapper.stayregisterProc(motel);
		return "숙소 DB 작성 완료";

	}

	/* 객실별 정보 일람 */
	public void stayInfo(String cp, Model model) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}

		int pageBlock = 10;
		int end = pageBlock * currentPage;
		int begin = end - pageBlock + 1;

		ArrayList<MotelDTO> motels = adminStayMapper.stayInfo(begin, end);
		int totalCount = adminStayMapper.count();
		String url = "stayInfo?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);

		model.addAttribute("motels", motels);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

	public MotelDTO stayContent(String n) {
		int no = 0;
		try {
			no = Integer.parseInt(n);
		} catch (Exception e) {
			return null;
		}

		MotelDTO motel = adminStayMapper.stayContent(no);
		if (motel == null)
			return null;

		/* 이미지는 DB 등록이 되야 출력이 해결될듯 */
		System.out.println("motel.getMimage() : " + motel.getMimage());
		System.out.println("motel.getMimage() : " + motel.getMimage().isEmpty());

		return motel;
	}

	public MotelDTO stayDetailRegister(String n) {
		int no = 0;

		try {
			no = Integer.parseInt(n);
		} catch (Exception e) {
			return null;
		}

		MotelDTO motel = adminStayMapper.stayContent(no);
		if (motel == null)
			return null;

		return motel;
	}

	/* 모텔 객실 DB 등록 = 숙소 상세 DB 등록 */
	public String staydetailregisterProc(MultipartHttpServletRequest multi) {
		MotelRoomDTO motelroom = new MotelRoomDTO();
		int no = (int) session.getAttribute("no");
		String mcode = (String) session.getAttribute("code");

		motelroom.setNo(no);
		motelroom.setMcode(mcode);
		motelroom.setMroomcode(multi.getParameter("mroomcode"));
		motelroom.setMroomname(multi.getParameter("mroomname"));
		motelroom.setMroomimage(multi.getParameter("mroomimage"));
		motelroom.setMroomnumber(getIntParameter(multi, "mroomnumber"));
		motelroom.setMdaesilprice(getIntParameter(multi, "mdaesilprice"));
		motelroom.setMstayprice(getIntParameter(multi, "mstayprice"));
		motelroom.setMdaesilcheckin(multi.getParameter("mdaesilcheckin"));
		motelroom.setMdaesilcheckout(multi.getParameter("mdaesilcheckout"));
		motelroom.setMdaesiltime(multi.getParameter("mdaesiltime"));
		motelroom.setMstaycheckin(multi.getParameter("mstaycheckin"));
		motelroom.setMstaycheckout(multi.getParameter("mstaycheckout"));
		motelroom.setMoption("0");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		motelroom.setMroomimage("");
		MultipartFile file = multi.getFile("mroomimage");
		String fileName = file.getOriginalFilename();
		if (file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			motelroom.setMroomimage(fileName);

			// 업로드 파일 저장 경로
			String fileLocation = "C:\\javas\\upload\\room\\";
			File save = new File(fileLocation + fileName);

			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		adminStayMapper.staydetailregisterProc(motelroom);
		return "객실 DB 작성 완료";

	}

	/* Multipart~~로 받아오는 일부 값들을 int형으로 변환하기 위해서 */
	private int getIntParameter(MultipartHttpServletRequest multi, String paramName) {
		String paramValue = multi.getParameter(paramName);
		try {
			return Integer.parseInt(paramValue);
		} catch (NumberFormatException e) {
			// 예외 처리: 파라미터 값을 int로 변환할 수 없는 경우 기본값 또는 에러 처리를 하면 됨
			return 0; // 예시로 0을 반환
		}
	}

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
