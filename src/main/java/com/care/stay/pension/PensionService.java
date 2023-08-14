package com.care.stay.pension;

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
public class PensionService {
	@Autowired private PensionMapper pensionMapper;
	@Autowired private HttpSession session;

	public void pensionform(Model model) {

	}

	/* 펜션 DB 등록 */
	// 숙소의 종류나 등록양식이 서로 조금씩 달라서 각 숙소별 Service 파일로 분배함
	public String stayregisterProc(MultipartHttpServletRequest multi) {
		PensionDTO pension = new PensionDTO();
		pension.setPname(multi.getParameter("name"));
		pension.setPregion(multi.getParameter("region"));
		pension.setPdetailRegion(multi.getParameter("detailRegion"));
		pension.setPaddress(multi.getParameter("address"));
		pension.setPdetailAddress(multi.getParameter("detailAddress"));
		pension.setPinfo(multi.getParameter("info"));
		
		pension.setPcheckInTime(multi.getParameter("pcheckinTime"));
		pension.setPcheckOutTime(multi.getParameter("pcheckoutTime"));
		pension.setPtype(multi.getParameter("ptype"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		pension.setPimage("");
		
		MultipartFile file = multi.getFile("imageupload");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			pension.setPimage(fileName);
			
			System.out.println(fileName);
			System.out.println(multi.getParameter("info"));
			System.out.println();
			
			// 업로드 파일 저장 경로
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\pension\\";
			File save = new File(fileLocation + fileName);
			
			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		pensionMapper.stayregisterProc(pension);
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
		
		ArrayList<PensionDTO> pensions = pensionMapper.stayInfo(begin, end);
		int totalCount = pensionMapper.count();
		String url = "stayInfo?currentPage=";
		String result = AdminPageService.printPage(url, currentPage, totalCount, pageBlock, stayType);
		
		model.addAttribute("pensions", pensions);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
		
	}
	
	
	public String staydetailregisterProc(MultipartHttpServletRequest multi) {
		PensionRoomDTO pensionroom = new PensionRoomDTO();
        int no = (int) session.getAttribute("no");
        String pCode = (String) session.getAttribute("code");
        int roomcount = pensionMapper.pensionroomcount();
        
        pensionroom.setNo(no);
        pensionroom.setPcode(pCode);
        pensionroom.setProomCode(String.valueOf(roomcount));
        pensionroom.setProomName(multi.getParameter("roomname"));
        pensionroom.setProomNumber(getIntParameter(multi, "roomnumber"));
        pensionroom.setPprice(multi.getParameter("pprice"));
        pensionroom.setPpeople(getIntParameter(multi, "ppeople"));
        
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

		String poptions;
		if (checks.isEmpty()) {
			poptions = "";
		} else {
			poptions = String.join(",", checks);
		}
		pensionroom.setPcomfort(poptions);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		pensionroom.setProomImage("");
		MultipartFile file = multi.getFile("roomimage");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			pensionroom.setProomImage(fileName);

			// 업로드 파일 저장 경로
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\pension\\room\\";
			File save = new File(fileLocation + fileName);
			
			try {
				// 서버가 저장한 업로드 파일은 임시저장경로에 있는데 개발자가 원하는 경로로 이동
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		pensionMapper.staydetailregisterProc(pensionroom);
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

	public PensionDTO stayContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		PensionDTO pension = pensionMapper.stayContent(no);
		if(pension == null)
			return null;

		return pension;
	}

	public List<PensionRoomDTO> stayRoomContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		return pensionMapper.stayRoomContent(n);
	}
	
	public PensionDTO stayDetailRegister (String n) {
		int no = 0;
		
		try {
			no = Integer.parseInt(n);
		} catch(Exception e) {
			return null;
		}
		
		PensionDTO pension = pensionMapper.stayContent(no);
		if(pension == null)
			return null;
		
		return pension;
	}

	public String stayModifyProc(MultipartHttpServletRequest multi) {
		// TODO Auto-generated method stub
		return null;
	}
}
