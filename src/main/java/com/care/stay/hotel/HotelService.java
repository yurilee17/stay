package com.care.stay.hotel;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import jakarta.servlet.http.HttpSession;
import com.care.stay.common.PageService;


@Service
public class HotelService {
	
	  @Autowired private HotelMapper hotelMapper;
	  @Autowired private HttpSession session;
	  
	  public void hotellist(String cp, Model model) { 
		  int currentPage = 1; 
		  try{
			  currentPage = Integer.parseInt(cp); 
			  }catch(Exception e){ 
				  currentPage = 1; 
			  }
	  
	  int pageBlock = 3; // 한 페이지에 보일 데이터의 수 
	  int end = pageBlock * currentPage; //테이블에서 가져올 마지막 행번호 
	  int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
	  
	  ArrayList<HotelDTO> hotels = hotelMapper.hotellist(begin, end); 
	  int totalCount = hotelMapper.count(); 
	  String url = "hotellist?currentPage=";
	  String result = PageService.printPage(url, currentPage, totalCount,pageBlock);
	  
	  System.out.println("pageBlock" + pageBlock);
	  System.out.println("totalCount" + totalCount);
	  
	  model.addAttribute("hotels", hotels); 
	  model.addAttribute("result", result);
	  model.addAttribute("currentPage", currentPage); 
	  }
}