package com.care.stay.camping;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.common.PageService;

@Service
public class CampingService {
	@Autowired private CampingMapper campingMapper;

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
		camping.setCcheckInTime(multi.getParameter("checkinTime"));
		camping.setCcheckOutTime(multi.getParameter("checkoutTime"));
		camping.setCtype(multi.getParameter("htype"));
		
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
		
		ArrayList<CampingDTO> campings = campingMapper.stayInfo(begin, end);
		int totalCount = campingMapper.count();
		String url = "stayInfo?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("campings", campings);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);		
	}

}
