package com.care.stay.admin;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.hotel.HotelDTO;
import com.care.stay.motel.MotelDTO;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminStayService {
	@Autowired private AdminStayMapper adminStayMapper;
	@Autowired private HttpSession session;
	
	public String stayregisterProc(MultipartHttpServletRequest multi) {
		MotelDTO motel = new MotelDTO();
		motel.setMcode(multi.getParameter("code"));
		motel.setMname(multi.getParameter("name"));
		motel.setMregion(multi.getParameter("region"));
		motel.setMdetailregion(multi.getParameter("detailRegion"));
		motel.setMinfo(multi.getParameter("info"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
		/*밑에꺼 주석 풀면 submit가 안되고 자꾸 redirect됨*/
		
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
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			motel.setMimage(fileName);
			
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
		
		adminStayMapper.stayregisterProc(motel);
		return "게시글 작성 완료";
		
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
}
