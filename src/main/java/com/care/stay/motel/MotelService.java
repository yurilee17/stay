package com.care.stay.motel;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.care.stay.common.AdminPageService;
import com.care.stay.common.PageService;
import com.care.stay.hotel.HotelDTO;
import com.care.stay.hotel.HotelRoomDTO;

import jakarta.servlet.http.HttpSession;

@Service
public class MotelService {
	@Autowired private MotelMapper motelMapper;
	@Autowired private HttpSession session;
	
	public static void motelform(Model model) {

	}
	
	/* 모텔 DB 등록 */
	// 숙소의 종류나 등록양식이 서로 조금씩 달라서 각 숙소별 Service 파일로 분배함
	public String stayregisterProc(MultipartHttpServletRequest multi) {
		MotelDTO motel = new MotelDTO();
		motel.setMname(multi.getParameter("name"));
		motel.setMregion(multi.getParameter("region"));
		motel.setMdetailregion(multi.getParameter("detailregion"));
		motel.setMaddress(multi.getParameter("address"));
		motel.setMdetailaddress(multi.getParameter("detailaddress"));
		motel.setMinfo(multi.getParameter("info"));
		motel.setMdaesilcheckin(multi.getParameter("mdaesilcheckin"));
		motel.setMdaesilcheckout(multi.getParameter("mdaesilcheckout"));
		motel.setMdaesiltime(getIntParameter(multi, "mdaesiltime"));
		motel.setMstaycheckin(multi.getParameter("mstaycheckin"));
		motel.setMstaycheckout(multi.getParameter("mstaycheckout"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
//		if(motel.getMname() == null || motel.getMname().isEmpty()) {
//			return "숙소 이름을 입력하세요.";
//		}
//		if(motel.getMregion() == null || motel.getMregion().isEmpty()) {
//			return "지역을 선택하세요.";
//		}
//		if(motel.getMdetailRegion() == null || motel.getMdetailRegion().isEmpty()) {
//			return "세부지역을 선택하세요.";
//		}		
//		if(motel.getMaddress() == null || motel.getMaddress().isEmpty()) {
//			return "주소를 입력하세요.";
//		}
//		if(motel.getMdetailAddress() == null || motel.getMdetailAddress().isEmpty()) {
//			return "상세주소를 입력하세요.";
//		}
//		if(motel.getMinfo() == null || motel.getMinfo().isEmpty()) {
//			return "숙소의 정보를 입력하세요.";
//		}
		
		motel.setMimage("");
		MultipartFile file = multi.getFile("imageupload");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\motel\\";
			motel.setMimage(fileLocation + fileName);
			File save = new File(fileLocation + fileName);
			
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		motelMapper.stayregisterProc(motel);
		return "숙소 DB 작성 완료";
	}


	/*모텔 객실 DB(숙소 상세 DB) 등록*/
	public String staydetailregisterProc(MultipartHttpServletRequest multi) {
		MotelRoomDTO motelroom = new MotelRoomDTO();
        int no = (int) session.getAttribute("no");
        String mCode = (String) session.getAttribute("code");
        int roomcount = motelMapper.motelroomcount();

		motelroom.setNo(no);
		motelroom.setMcode(mCode);
        motelroom.setMroomcode(roomcount);
		motelroom.setMroomname(multi.getParameter("roomname"));
		motelroom.setMroomnumber(getIntParameter(multi, "roomnumber"));
		motelroom.setMdaesilprice(getIntParameter(multi, "mdaesilprice"));
	    motelroom.setMstayprice(getIntParameter(multi, "mstayprice"));
	    
		/* option값(기타 부대시설)들을 배열로 가져온 다음 문자열로 변환시킨 후 db에 추가하는 과정 */
		String[] check1 = multi.getParameterValues("check1");
		String[] check2 = multi.getParameterValues("check2");
		String[] check3 = multi.getParameterValues("check3");

		List<String> checks = new ArrayList<>();
		
		if (check1 != null) {
		    checks.addAll(Arrays.asList(check1));
		}
		if (check2 != null) {
		    checks.addAll(Arrays.asList(check2));
		}
		if (check3 != null) {
		    checks.addAll(Arrays.asList(check3));
		}

		String moptions;
		if (checks.isEmpty()) {
			moptions = "";
		} else {
			moptions = String.join(",", checks);
		}
		motelroom.setMoption(moptions);
		/* option값(기타 부대시설)들을 배열로 가져온 다음 문자열로 변환시킨 후 db에 추가하는 과정 */
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		motelroom.setMroomimage("");
		MultipartFile file = multi.getFile("roomimage");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			motelroom.setMroomimage(fileName);
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\motel\\room\\";
			File save = new File(fileLocation + fileName);
			
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		motelMapper.staydetailregisterProc(motelroom);
		return "객실 DB 작성 완료";
		
	}
	

	public void stayInfo(String cp, String stayType, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 10;
		int end = pageBlock * currentPage;
		int begin = end - pageBlock + 1;
		
		System.out.println("현재 stayType은 : " + stayType + "입니다.");
		
		ArrayList<MotelDTO> motels = motelMapper.stayInfo(begin, end);
		int totalCount = motelMapper.count();
		String url = "stayInfo?currentPage=";
		String result = AdminPageService.printPage(url, currentPage, totalCount, pageBlock, stayType);
		
		model.addAttribute("motels", motels);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	
	public MotelDTO stayContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		MotelDTO motel = motelMapper.stayContent(no);
		if(motel == null)
			return null;
		return motel;
	}
	
	public MotelRoomDTO roomContent(String rc) {
		int mroomcode = 0;
		try{
			mroomcode = Integer.parseInt(rc);
		}catch(Exception e){
			return null;
		}
		
		MotelRoomDTO motelroom = motelMapper.roomContent(mroomcode);
		if(motelroom == null)
			return null;
		return motelroom;
		
	}
	
	
	public List<MotelRoomDTO> stayRoomContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		return motelMapper.stayRoomContent(n);
	}

	
	public MotelDTO stayDetailRegister (String n) {
		int no = 0;
		
		try {
			no = Integer.parseInt(n);
		} catch(Exception e) {
			return null;
		}
		
		MotelDTO motel = motelMapper.stayContent(no);
		if(motel == null)
			return null;
		
		return motel;
	}
	
	
	/*Multipart~~로 받아오는 일부 값들을 int형으로 변환하기 위해서*/
	private int getIntParameter(MultipartHttpServletRequest multi, String paramName) {
	    String paramValue = multi.getParameter(paramName);
	    try {
	        return Integer.parseInt(paramValue);
	    } catch (NumberFormatException e) {
	    	
	        return 0; 
	    }
	}
	
	
	
	public String stayModifyProc(MultipartHttpServletRequest multi) {
	    String stayType = multi.getParameter("stayType");

	    MotelDTO motel = new MotelDTO();
	    motel.setMname(multi.getParameter("name"));
	    motel.setMregion(multi.getParameter("region"));
	    motel.setMdetailregion(multi.getParameter("detailregion"));
	    motel.setMaddress(multi.getParameter("address"));
	    motel.setMdetailaddress(multi.getParameter("detailaddress"));
	    motel.setMinfo(multi.getParameter("info"));
	    motel.setMdaesilcheckin(multi.getParameter("mdaesilcheckin"));
	    motel.setMdaesilcheckout(multi.getParameter("mdaesilcheckout"));
	    motel.setMdaesiltime(getIntParameter(multi, "mdaesiltime"));
	    motel.setMstaycheckin(multi.getParameter("mstaycheckin"));
	    motel.setMstaycheckout(multi.getParameter("mstaycheckout"));
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	    MultipartFile file = multi.getFile("imageupload");
	    String fileName = file.getOriginalFilename();
	    String fileLocation = "C:\\Users\\niceh\\git\\stay\\src\\main\\webapp\\resource\\img\\motel\\";

	    // 기존 이미지 파일 삭제
	    String existingImagePath = motel.getMimage();
	    if (existingImagePath != null && !existingImagePath.isEmpty()) {
	        File existingFile = new File(existingImagePath);
	        if (existingFile.exists()) {
	            existingFile.delete();  // 기존 파일 삭제
	        }
	    }

	    // 새 이미지 파일 업로드
	    if (file.getSize() != 0 && file != null) {
	        // 이미지 업로드 로직
	        sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
	        Calendar cal = Calendar.getInstance();
	        fileName = sdf.format(cal.getTime()) + fileName;
	        motel.setMimage(fileLocation + fileName);
	        File save = new File(fileLocation + fileName);

	        try {
	            file.transferTo(save);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    motelMapper.stayModifyProc(motel);
	    return "숙소 DB 수정 완료";
	}
	
	public String stayDeleteProc(String n) {
		int no = 0;
		try {
			no = Integer.parseInt(n);
		} catch(Exception e) {
			return "숙소 번호에 문제가 생겼습니다.";
		}
		
		MotelDTO motel = motelMapper.stayContent(no);
		if(motel == null)
			return "숙소 번호에 문제가 생겼습니다.";
		
		motelMapper.stayDeleteProc(no);
		
		String path = motel.getMimage();
		File file = new File(path);
		if(file.exists() == true) {
			file.delete();
		}
		
		return "숙소 정보 삭제 완료";
	}

	public void motellist(String cp, Model model) {
			int currentPage = 1; 
		  
		  try{ 
			  currentPage = Integer.parseInt(cp);
		  }catch(Exception e){
			  currentPage = 1; 
			  }
		  
		  int pageBlock = 6; // 한 페이지에 보일 데이터의 수 
		  int end = pageBlock * currentPage; //테이블에서 가져올 마지막 행번호 
		  int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		  
		  ArrayList<MotelDTO> motels = motelMapper.motellist(begin, end); 
			/* ArrayList<HotelDTO> hotels = hotelMapper.hotellist(); */
		  int totalCount = motelMapper.count(); String url = "motellist?currentPage=";
		  String result = PageService.printPage(url, currentPage,
		  totalCount,pageBlock);
		  
		  System.out.println("pageBlock " + pageBlock);
		  System.out.println("totalCount " + totalCount);
			/*
			 * System.out.println("mainMenu " + mainMenu); 
			 * System.out.println("subMenu "+ subMenu);
			 */
		  
		  model.addAttribute("motels", motels); 
		  model.addAttribute("result", result);
		  model.addAttribute("currentPage", currentPage);
		
	}
	
	public MotelDTO motelpage(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		MotelDTO motel = motelMapper.stayContent(no);
		if(motel == null)
			return null;
		
		return motel;
	}

	public MotelRoomDTO daesilReservation(String rc) {
		int mroomcode = 0;
		try {
			mroomcode = Integer.parseInt(rc);
		}catch(Exception e) {
			return null;
		}
		
		MotelRoomDTO motelroom = motelMapper.stayReservation(mroomcode);
		if(motelroom == null)
			return null;
		
		return motelroom;
	}
	
	
	 public List<MotelDTO> getAllMotelsWithMinPrices() {
	        List<MotelDTO> motels = motelMapper.getAllMotels();

	        for (MotelDTO motel : motels) {
	            int minPrice = motelMapper.findMinPriceByMotel(motel.getNo());
	            int minDaesilPrice = motelMapper.findMinDaesilPriceByMotel(motel.getNo());

	            motel.setMinprice(minPrice);
	            motel.setMindaesilprice(minDaesilPrice);
	        }

	        return motels;
	    }

	
}
