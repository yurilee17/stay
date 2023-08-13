package com.care.stay.hotel;

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
public class HotelService {
	@Autowired private HotelMapper hotelMapper;
	@Autowired private HttpSession session;

	public void hotelform(Model model) {
		
	}
	
	/* 호텔 DB 등록 */
	// 숙소의 종류나 등록양식이 서로 조금씩 달라서 각 숙소별 Service 파일로 분배함
	public String stayregisterProc(MultipartHttpServletRequest multi) {
		HotelDTO hotel = new HotelDTO();
		hotel.setHname(multi.getParameter("name"));
		hotel.setHregion(multi.getParameter("region"));
		hotel.setHdetailRegion(multi.getParameter("detailRegion"));
		hotel.setHaddress(multi.getParameter("address"));
		hotel.setHdetailAddress(multi.getParameter("detailAddress"));
		hotel.setHinfo(multi.getParameter("info"));
		
		hotel.setHcheckInTime(multi.getParameter("hcheckinTime"));
		hotel.setHcheckOutTime(multi.getParameter("hcheckoutTime"));
		hotel.setHtype(multi.getParameter("htype"));

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		hotel.setHimage("");
		MultipartFile file = multi.getFile("imageupload");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			hotel.setHimage(fileName);
			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\hotel\\";
			File save = new File(fileLocation + fileName);
			
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		hotelMapper.stayregisterProc(hotel);
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
		
		ArrayList<HotelDTO> hotels = hotelMapper.stayInfo(begin, end);
		int totalCount = hotelMapper.count();
		String url = "stayInfo?currentPage=";
		String result = AdminPageService.printPage(url, currentPage, totalCount, pageBlock, stayType);
		
		model.addAttribute("hotels", hotels);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}
	
	/*호텔 객실 DB(숙소 상세 DB) 등록*/
	public String staydetailregisterProc(MultipartHttpServletRequest multi) {
		HotelRoomDTO hotelroom = new HotelRoomDTO();
        int no = (int) session.getAttribute("no");
        String Hcode = (String) session.getAttribute("code");
        int roomcount = hotelMapper.hotelroomcount();
        
        hotelroom.setNo(no);
        hotelroom.setHcode(Hcode);
        hotelroom.setHroomCode(String.valueOf(roomcount));
        hotelroom.setHroomName(multi.getParameter("roomname"));
        hotelroom.setHbedType(multi.getParameter("hbedtype"));
        hotelroom.setHroomNumber(getIntParameter(multi, "roomnumber"));
        hotelroom.setHprice(getIntParameter(multi, "hprice"));
        hotelroom.setHpeople(getIntParameter(multi, "hpeople"));
        
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

		String hoptions;
		if (checks.isEmpty()) {
			hoptions = "";
		} else {
			hoptions = String.join(",", checks);
		}
		hotelroom.setHcomfort(hoptions);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		hotelroom.setHroomImage("");
		MultipartFile file = multi.getFile("roomimage");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			hotelroom.setHroomImage(fileName);

			String fileLocation = "C:\\Users\\hi\\git\\stay\\src\\main\\webapp\\resource\\img\\hotel\\room\\";
			File save = new File(fileLocation + fileName);
			
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		hotelMapper.staydetailregisterProc(hotelroom);
		return "객실 DB 작성 완료";
        
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

	public HotelDTO stayContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		HotelDTO hotel = hotelMapper.stayContent(no);
		if(hotel == null)
			return null;
		
		return hotel;
	}

	public List<HotelRoomDTO> stayRoomContent(String n) {
		int no = 0;
		try{
			no = Integer.parseInt(n);
		}catch(Exception e){
			return null;
		}
		
		return hotelMapper.stayRoomContent(n);
	}
	
	public HotelDTO stayDetailRegister (String n) {
		int no = 0;
		
		try {
			no = Integer.parseInt(n);
		} catch(Exception e) {
			return null;
		}
		
		HotelDTO hotel = hotelMapper.stayContent(no);
		if(hotel == null)
			return null;
		
		return hotel;
	}

	public String stayModifyProc(MultipartHttpServletRequest multi) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
