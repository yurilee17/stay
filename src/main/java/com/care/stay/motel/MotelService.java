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
import com.care.stay.common.PageService;

import jakarta.servlet.http.HttpSession;

@Service
public class MotelService {
	@Autowired private MotelMapper motelMapper;
	@Autowired private HttpSession session;
	
	public static void motelform(Model model) {

	}
	
	/* 숙소 DB 등록 */
	public String stayregisterProc(MultipartHttpServletRequest multi) {
		MotelDTO motel = new MotelDTO();
		motel.setMname(multi.getParameter("name"));
		motel.setMregion(multi.getParameter("region"));
		motel.setMdetailRegion(multi.getParameter("detailRegion"));
		motel.setMaddress(multi.getParameter("address"));
		motel.setMdetailAddress(multi.getParameter("detailAddress"));
		motel.setMinfo(multi.getParameter("info"));
		motel.setMdaesilCheckIn(multi.getParameter("mdaesilcheckin"));
		motel.setMdaesilCheckOut(multi.getParameter("mdaesilcheckout"));
		motel.setMdaesilTime(multi.getParameter("mdaesiltime"));
		motel.setMstayCheckIn(multi.getParameter("mstaycheckin"));
		motel.setMstayCheckOut(multi.getParameter("mstaycheckout"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/*밑에꺼 주석 풀면 submit가 안되고 자꾸 redirect됨*/
		
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
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			motel.setMimage(fileName);
			
			System.out.println(fileName);
			System.out.println(multi.getParameter("info"));
			System.out.println();
			
			// 업로드 파일 저장 경로
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\motel\\";
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
		System.out.println("상세 지역 : " + motel.getMdetailRegion());
//		
//		System.out.println(motel.getMaddress());
//		System.out.println(motel.getMimage());
//		System.out.println(motel.getMinfo());
//		System.out.println(motel.getMdetailAddress());

		motelMapper.stayregisterProc(motel);
		return "숙소 DB 작성 완료";
		
	}


	/*모텔 객실 DB 등록 = 숙소 상세 DB 등록*/
	public String staydetailregisterProc(MultipartHttpServletRequest multi) {
		MotelRoomDTO motelroom = new MotelRoomDTO();
        int no = (int) session.getAttribute("no");
        String mCode = (String) session.getAttribute("code");
        int roomcount = motelMapper.motelroomcount();

		motelroom.setNo(no);
		motelroom.setMcode(mCode);
        motelroom.setMroomCode(String.valueOf(roomcount));
		motelroom.setMroomName(multi.getParameter("mroomname"));
		motelroom.setMroomImage(multi.getParameter("mroomimage"));
		motelroom.setMroomNumber(getIntParameter(multi, "mroomnumber"));
		motelroom.setMdaesilPrice(getIntParameter(multi, "mdaesilprice"));
	    motelroom.setMstayPrice(getIntParameter(multi, "mstayprice"));

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

		String moptions = String.join(",", checks);
		motelroom.setMoption(moptions);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		motelroom.setMroomImage("");
		MultipartFile file = multi.getFile("mroomimage");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			motelroom.setMroomImage(fileName);

			// 업로드 파일 저장 경로
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\motel\\room\\";
			File save = new File(fileLocation + fileName);
			
			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		motelMapper.staydetailregisterProc(motelroom);
		return "객실 DB 작성 완료";
		
	}
	

	public void stayInfo(String cp, Model model) {
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		int pageBlock = 10;
		int end = pageBlock * currentPage;
		int begin = end - pageBlock + 1;
		
		ArrayList<MotelDTO> motels = motelMapper.stayInfo(begin, end);
		int totalCount = motelMapper.count();
		String url = "stayInfo?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
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
		
		/* 이미지는 DB 등록이 되야 출력이 해결될듯 */
//		System.out.println("motel.getMimage() : " + motel.getMimage());

		return motel;
	}
	
	
	public List<MotelRoomDTO> stayRoomContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		return motelMapper.stayRoomContent(n);
		
		
//		MotelRoomDTO motelroom = motelmapper.stayRoomContent(no);
//		if(motelroom == null)
//			return null;
//		
//		List<MotelRoomDTO> motelrooms = new ArrayList<>();
//	    motelrooms.add(motelroom);
//
//	    return motelrooms;
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
	        // 예외 처리: 파라미터 값을 int로 변환할 수 없는 경우 기본값 또는 에러 처리를 하면 됨
	        return 0; // 예시로 0을 반환
	    }
	}

	
}
