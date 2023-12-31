package com.care.stay.gh;

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
import com.care.stay.motel.MotelRoomDTO;
import com.care.stay.common.PageService;
import jakarta.servlet.http.HttpSession;

@Service
public class GHService {
	@Autowired private GHMapper ghMapper;
	@Autowired private HttpSession session;

	public void guesthouseform(Model model) {
		
	}

	public String stayregisterProc(MultipartHttpServletRequest multi) {
		GHDTO gh = new GHDTO();
		gh.setGname(multi.getParameter("name"));
		gh.setGregion(multi.getParameter("region"));
		gh.setGdetailregion(multi.getParameter("detailregion"));
		gh.setGaddress(multi.getParameter("address"));
		gh.setGdetailaddress(multi.getParameter("detailaddress"));
		gh.setGinfo(multi.getParameter("info"));
		
		gh.setGcheckintime(multi.getParameter("gcheckintime"));
		gh.setGcheckouttime(multi.getParameter("gcheckouttime"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		gh.setGimage("");
		MultipartFile file = multi.getFile("imageupload");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;

			// 업로드 파일 저장 경로
			String fileLocation = "/opt/tomcat/tomcat-10/webapps/upload/gh/";
			String imagesrc = "/upload/gh/";
			gh.setGimage(imagesrc + fileName);
			File save = new File(fileLocation + fileName);

			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		ghMapper.stayregisterProc(gh);
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
		
		ArrayList<GHDTO> ghs = ghMapper.stayInfo(begin, end);
		int totalCount = ghMapper.count();
		String url = "stayInfo?currentPage=";
		String result = AdminPageService.printPage(url, currentPage, totalCount, pageBlock, stayType);
		
		model.addAttribute("ghs", ghs);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
		
	}
	
	public String staydetailregisterProc(MultipartHttpServletRequest multi) {
		GHRoomDTO ghroom = new GHRoomDTO();
        int no = (int) session.getAttribute("no");
        String gCode = (String) session.getAttribute("code");
        int roomcount = ghMapper.ghroomcount();
        
        ghroom.setNo(no);
        ghroom.setGcode(gCode);
        ghroom.setGroomcode(roomcount);
        ghroom.setGroomname(multi.getParameter("roomname"));
        ghroom.setGbedtype(multi.getParameter("gbedtype"));
        ghroom.setGroomnumber(getIntParameter(multi, "roomnumber"));
        ghroom.setGprice(getIntParameter(multi, "gprice"));
        ghroom.setGpeople(getIntParameter(multi, "gpeople"));
        
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

		String goptions;
		if (checks.isEmpty()) {
			goptions = "";
		} else {
			goptions = String.join(",", checks);
		}
		ghroom.setGcomfort(goptions);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		ghroom.setGroomimage("");
		MultipartFile file = multi.getFile("roomimage");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;


			// 업로드 파일 저장 경로
			String fileLocation = "/opt/tomcat/tomcat-10/webapps/upload/gh/room/";
			String imagesrc = "/upload/gh/room/";
			ghroom.setGroomimage(imagesrc + fileName);			
			File save = new File(fileLocation + fileName);
			
			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		ghMapper.staydetailregisterProc(ghroom);
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

	public GHDTO stayContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		GHDTO gh = ghMapper.stayContent(no);
		if(gh == null)
			return null;

		return gh;
	}
	
	public GHRoomDTO roomContent(String rc) {
		int groomcode = 0;
		try{
			groomcode = Integer.parseInt(rc);
		}catch(Exception e){
			return null;
		}
		
		GHRoomDTO ghroom = ghMapper.roomContent(groomcode);
		if(ghroom == null)
			return null;
		return ghroom;
		
	}

	public List<GHRoomDTO> stayRoomContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		return ghMapper.stayRoomContent(n);
	}
	
	public GHDTO stayDetailRegister (String n) {
		int no = 0;
		
		try {
			no = Integer.parseInt(n);
		} catch(Exception e) {
			return null;
		}
		
		GHDTO gh = ghMapper.stayContent(no);
		if(gh == null)
			return null;
		
		return gh;
	}


	public void getAllHotelsWithMinPrices() {
		List<GHDTO> ghs = ghMapper.getAllGHs();
		for (GHDTO gh : ghs) {
			int minPrice = ghMapper.findMinPriceByGuestHouse(gh.getNo());
			
			gh.setMinprice(minPrice);
			ghMapper.updatePrices(gh);
		}
		
	}

	public void MainCheck(String selectedText, String checkindate, String checkoutdate, String gbedtype,
			String gcomfort, String gpeople, String cp, Model model) {

		int currentPage = 1;
		
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}
		System.out.println("1");
		int pageBlock = 6; // 한 페이지에 보일 데이터의 수
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		System.out.println("2");
		ArrayList<GHDTO> ghs = ghMapper.MainCheck(selectedText, gbedtype, gcomfort, gpeople, begin, end);
		System.out.println("3");
		int totalCount = ghMapper.count();
		String url = "ghlist?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		for (GHDTO gh : ghs) {
			GHRoomDTO rooms = gh.getRooms();
			System.out.println(rooms.getGroomnumber());
		}
		
		ArrayList<GHDTO> ghResult = new ArrayList<GHDTO>();
		int resNum = 0;
		for (GHDTO gh : ghs) {
			GHRoomDTO rooms = gh.getRooms();
			System.out.println("Groomnumber" + rooms.getGroomnumber());
			
			resNum = ghMapper.resNum(rooms.getGcode(), rooms.getNo(), rooms.getGroomcode(), checkindate, checkoutdate);
			System.out.println("resNum" + resNum);
			if (resNum < rooms.getGroomnumber()) {
				ghResult.add(gh);
			}
			
		}
		
		model.addAttribute("ghs", ghResult);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
		
	}

	public void Main(String selectedText, String cp, Model model) {

		int currentPage = 1;
		
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}
		
		int pageBlock = 6; // 한 페이지에 보일 데이터의 수
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
		
		int totalCount = ghMapper.count();
		String url = "ghlist?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);

		if (selectedText != null) {
			ArrayList<GHDTO> ghs = ghMapper.Main(selectedText, begin, end);
			
			model.addAttribute("ghs", ghs);
			model.addAttribute("result", result);
			model.addAttribute("currentPage", currentPage);
		}
		
	}

	public String stayModifyProc(MultipartHttpServletRequest multi) {
		// TODO Auto-generated method stub
		return null;
	}


}
