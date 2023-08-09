package com.care.stay.pension;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.common.PageService;

@Service
public class PensionService {
	@Autowired private PensionMapper pensionMapper;

	public void pensionform(Model model) {

	}

	public String stayregisterProc(MultipartHttpServletRequest multi) {
		return null;
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
		
		ArrayList<PensionDTO> pensions = pensionMapper.stayInfo(begin, end);
		int totalCount = pensionMapper.count();
		String url = "stayInfo?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("pensions", pensions);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
		
	}

}
