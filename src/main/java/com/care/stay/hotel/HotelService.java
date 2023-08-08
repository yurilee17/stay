package com.care.stay.hotel;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.motel.MotelDTO;

@Service
public class HotelService {
	@Autowired private HotelMapper hotelMapper;

	public void hotelform(Model model) {
		
	}
	
	public String stayregisterProc(MultipartHttpServletRequest multi) {
		HotelDTO hotel = new HotelDTO();
		hotel.setHname(multi.getParameter("name"));
		hotel.setHregion(multi.getParameter("region"));
		hotel.setHdetailRegion(multi.getParameter("detailRegion"));
		hotel.setHaddress(multi.getParameter("address"));
		hotel.setHdetailAddress(multi.getParameter("detailAddress"));
		hotel.setHinfo(multi.getParameter("info"));
		hotel.setHcheckinTime(multi.getParameter("checkinTime"));
		hotel.setHcheckoutTime(multi.getParameter("checkoutTime"));
		hotel.setHtype(multi.getParameter("type"));
		hotel.setHpeople(0);
		hotel.setHbedtype(multi.getParameter("bedType"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		hotel.setHimage("");
		MultipartFile file = multi.getFile("imageupload");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			hotel.setHimage(fileName);
			
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

		System.out.println("상세 지역 : " + hotel.getHdetailRegion());

		hotelMapper.stayregisterProc(hotel);
		return "숙소 DB 작성 완료";
		
	}
	
}
