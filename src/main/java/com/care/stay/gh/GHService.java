package com.care.stay.gh;

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
public class GHService {
	@Autowired private GHMapper ghMapper;

	public void guesthouseform(Model model) {
		
	}

	public String stayregisterProc(MultipartHttpServletRequest multi) {
		GHDTO gh = new GHDTO();
		gh.setGname(multi.getParameter("name"));
		gh.setGregion(multi.getParameter("region"));
		gh.setGdetailRegion(multi.getParameter("detailRegion"));
		gh.setGaddress(multi.getParameter("address"));
		gh.setGdetailAddress(multi.getParameter("detailAddress"));
		gh.setGinfo(multi.getParameter("info"));
		gh.setGcheckInTime(multi.getParameter("checkinTime"));
		gh.setGcheckOutTime(multi.getParameter("checkoutTime"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		gh.setGimage("");
		MultipartFile file = multi.getFile("imageupload");
		String fileName = file.getOriginalFilename();
		if(file.getSize() != 0) {
			// 파일의 중복을 해결하기 위해 시간의 데이터를 파일이름으로 구성함.
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar cal = Calendar.getInstance();
			fileName = sdf.format(cal.getTime()) + fileName;
			gh.setGimage(fileName);
			
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

		ghMapper.stayregisterProc(gh);
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
		
		ArrayList<GHDTO> ghs = ghMapper.stayInfo(begin, end);
		int totalCount = ghMapper.count();
		String url = "stayInfo?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("ghs", ghs);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
		
	}

}
