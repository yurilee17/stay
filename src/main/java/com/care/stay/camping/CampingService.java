package com.care.stay.camping;

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
import jakarta.servlet.http.HttpSession;

@Service
public class CampingService {
	@Autowired private CampingMapper campingMapper;
	@Autowired private HttpSession session;

	public void campingform(Model model) {

	}

	public String stayregisterProc(MultipartHttpServletRequest multi) {
		CampingDTO camping = new CampingDTO();
		camping.setCname(multi.getParameter("name"));
		camping.setCregion(multi.getParameter("region"));
		camping.setCdetailRegion(multi.getParameter("detailRegion"));
		camping.setCaddress(multi.getParameter("address"));
		camping.setCdetailAddress(multi.getParameter("detailAddress"));
		camping.setCinfo(multi.getParameter("info"));
		
		camping.setCcheckInTime(multi.getParameter("ccheckinTime"));
		camping.setCcheckOutTime(multi.getParameter("ccheckoutTime"));
		camping.setCtype(multi.getParameter("ctype"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		camping.setCimage("");
		MultipartFile file = multi.getFile("imageupload");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			camping.setCimage(fileName);
			
			System.out.println(fileName);
			System.out.println(multi.getParameter("info"));
			System.out.println();
			
			// 업로드 파일 저장 경로
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\hotel\\";
			File save = new File(fileLocation + fileName);
			
			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		campingMapper.stayregisterProc(camping);
		return "숙소 DB 작성 완료";
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
		
		ArrayList<CampingDTO> campings = campingMapper.stayInfo(begin, end);
		int totalCount = campingMapper.count();
		String url = "stayInfo?currentPage=";
		String result = AdminPageService.printPage(url, currentPage, totalCount, pageBlock, stayType);
		
		model.addAttribute("campings", campings);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);		
	}

	
	public String staydetailregisterProc(MultipartHttpServletRequest multi) {
		CampingRoomDTO campingroom = new CampingRoomDTO();
        int no = (int) session.getAttribute("no");
        String cCode = (String) session.getAttribute("code");
        int roomcount = campingMapper.campingroomcount();
        
        campingroom.setNo(no);
        campingroom.setCcode(cCode);
        campingroom.setCroomCode(String.valueOf(roomcount));
        campingroom.setCroomName(multi.getParameter("roomname"));
        campingroom.setCroomNumber(getIntParameter(multi, "roomnumber"));
        campingroom.setCprice(multi.getParameter("cprice"));
        campingroom.setCpeople(getIntParameter(multi, "cpeople"));
        campingroom.setCcomfort(multi.getParameter("ccomfort"));
        
        /* option값들을 배열로 가져온 다음 문자열로 변환시킨 후 db에 추가하는 과정 */
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

		String coptions;
		if (checks.isEmpty()) {
			coptions = "";
		} else {
			coptions = String.join(",", checks);
		}
		campingroom.setCcomfort(coptions);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		campingroom.setCroomImage("");
		MultipartFile file = multi.getFile("roomimage");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			campingroom.setCroomImage(fileName);

			// 업로드 파일 저장 경로
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\camping\\room\\";
			File save = new File(fileLocation + fileName);
			
			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		campingMapper.staydetailregisterProc(campingroom);
		return "객실 DB 작성 완료";
        
	}
	
	
	/*Multipart~~로 받아오는 일부 값들을 int형으로 변환하기 위해서*/
	private int getIntParameter(MultipartHttpServletRequest multi, String paramName) {
	    String paramValue = multi.getParameter(paramName);
	    try {
	        return Integer.parseInt(paramValue);
	    } catch (NumberFormatException e) {
	        // 예외 처리: 파라미터 값을 int로 변환할 수 없는 경우 기본값 또는 에러 처리를 하면 됨
	        return 0; // 예시로 0을 반환
	    }
	}

	public CampingDTO stayContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		CampingDTO camping = campingMapper.stayContent(no);
		if(camping == null)
			return null;

		return camping;
	}

	public List<CampingRoomDTO> stayRoomContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		return campingMapper.stayRoomContent(n);
	}
	
	public CampingDTO stayDetailRegister (String n) {
		int no = 0;
		
		try {
			no = Integer.parseInt(n);
		} catch(Exception e) {
			return null;
		}
		
		CampingDTO camping = campingMapper.stayContent(no);
		if(camping == null)
			return null;
		
		return camping;
	}


	public String stayModifyProc(MultipartHttpServletRequest multi) {
		// TODO Auto-generated method stub
		return null;
	}
}