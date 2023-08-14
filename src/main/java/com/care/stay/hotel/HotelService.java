package com.care.stay.hotel;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import com.care.stay.common.PageService;

@Service
public class HotelService {

	@Autowired
	private HotelMapper hotelMapper;
	@Autowired
	private HttpSession session;

	
	  public void hotellist(String cp,  Model model) { 

	  int currentPage = 1; 
	  
	  try{ 
		  currentPage = Integer.parseInt(cp);
	  }catch(Exception e){
		  currentPage = 1; 
		  }
	  
	  int pageBlock = 6; // 한 페이지에 보일 데이터의 수 
	  int end = pageBlock * currentPage; //테이블에서 가져올 마지막 행번호 
	  int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
	  
	  ArrayList<HotelDTO> hotels = hotelMapper.hotellist(begin, end); 
		/* ArrayList<HotelDTO> hotels = hotelMapper.hotellist(); */
	  int totalCount = hotelMapper.count(); String url = "hotellist?currentPage=";
	  String result = PageService.printPage(url, currentPage,
	  totalCount,pageBlock);
	  
	  System.out.println("pageBlock " + pageBlock);
	  System.out.println("totalCount " + totalCount);
		/*
		 * System.out.println("mainMenu " + mainMenu); 
		 * System.out.println("subMenu "+ subMenu);
		 */
	  
	  model.addAttribute("hotels", hotels); 
	  model.addAttribute("result", result);
	  model.addAttribute("currentPage", currentPage);
	  
	  
	  }
	 
	  
	  // 지역별 호텔리스트 나오게 
	  public void Main(String selectedText, String cp,  Model model) { 

	  int currentPage = 1; 
	  
	  try{ 
		  currentPage = Integer.parseInt(cp);
	  }catch(Exception e){
		  currentPage = 1; 
		  }
	  
	  int pageBlock = 6; // 한 페이지에 보일 데이터의 수 
	  int end = pageBlock * currentPage; //테이블에서 가져올 마지막 행번호 
	  int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
	  
	  
	  ArrayList<HotelDTO> hotels = hotelMapper.Main(selectedText, begin, end); 
	  int totalCount = hotelMapper.count(); 
	  String url = "hotellist?currentPage=";
	  String result = PageService.printPage(url, currentPage, totalCount,pageBlock);
	  
	  System.out.println("service에서 " + selectedText );
	  System.out.println("pageBlock " + pageBlock);
	  System.out.println("totalCount " + totalCount);

	  model.addAttribute("hotels", hotels); 
	  model.addAttribute("result", result);
	  model.addAttribute("currentPage", currentPage);
	  
	  
	  }
	  
	  
	  // 체크박스 선택시 조건에 맞게 호텔리스트 나오게 
	  public void MainCheck(String selectedText, String selectedValues1, String selectedValues2, String selectedValues3, int personCount,  String cp,  Model model) { 

	  int currentPage = 1; 
	  
	  try{ 
		  currentPage = Integer.parseInt(cp);
	  }catch(Exception e){
		  currentPage = 1; 
		  }
	  
	  int pageBlock = 6; // 한 페이지에 보일 데이터의 수 
	  int end = pageBlock * currentPage; //테이블에서 가져올 마지막 행번호 
	  int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
	  
	  
	  ArrayList<HotelDTO> hotels = hotelMapper.MainCheck(selectedText, selectedValues1, selectedValues2, selectedValues3, personCount,  begin, end); 
	  int totalCount = hotelMapper.count(); 
	  String url = "hotellist?currentPage=";
	  String result = PageService.printPage(url, currentPage, totalCount,pageBlock);
	  
	  System.out.println("service에서 " + selectedText );
	  System.out.println("pageBlock " + pageBlock);
	  System.out.println("service에서 selectedValues1 " + selectedValues1);
	  System.out.println("service에서 selectedValues2 " + selectedValues2);
	  System.out.println("service에서 selectedValues3 " + selectedValues3);
	  System.out.println("service에서 personCount " + personCount);

	  
	  model.addAttribute("hotels", hotels); 
	  model.addAttribute("result", result);
	  model.addAttribute("currentPage", currentPage);
	  
	  
	  }
	  
	  
	
}