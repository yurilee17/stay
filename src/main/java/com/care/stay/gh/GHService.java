package com.care.stay.gh;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.common.PageService;

@Service
public class GHService {
	@Autowired private GHMapper ghMapper;

	public void guesthouseform(Model model) {
		
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
		
		ArrayList<GHDTO> ghs = ghMapper.stayInfo(begin, end);
		int totalCount = ghMapper.count();
		String url = "stayInfo?currentPage=";
		String result = PageService.printPage(url, currentPage, totalCount, pageBlock);
		
		model.addAttribute("ghs", ghs);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
		
	}

}
