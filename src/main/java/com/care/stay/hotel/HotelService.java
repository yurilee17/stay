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

	//  1차시도!
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
	 
	
	// 2차시도
	/*
	 * public void hotellist(String cp, String mainMenu, String subMenu, Model
	 * model) { if(mainMenu == null){ mainMenu = ""; }
	 * 
	 * int currentPage = 1; try{ currentPage = Integer.parseInt(cp);
	 * }catch(Exception e){ currentPage = 1; }
	 * 
	 * int pageBlock = 3; // 한 페이지에 보일 데이터의 수 int end = pageBlock * currentPage; //
	 * 테이블에서 가져올 마지막 행번호 int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
	 * 
	 * ArrayList<HotelDTO> members = hotelMapper.hotellist(begin, end, mainMenu,
	 * subMenu); int totalCount = hotelMapper.count(mainMenu, subMenu); String url =
	 * "memberInfo?select="+mainMenu+"&search="+subMenu+"&currentPage="; String
	 * result = PageService.printPage(url, currentPage, totalCount, pageBlock);
	 * 
	 * model.addAttribute("members", members); model.addAttribute("result", result);
	 * model.addAttribute("currentPage", currentPage); }
	 */
	  
	  
	  public void Main1_1(String cp,  Model model) { 

	  int currentPage = 1; 
	  
	  try{ 
		  currentPage = Integer.parseInt(cp);
	  }catch(Exception e){
		  currentPage = 1; 
		  }
	  
	  int pageBlock = 6; // 한 페이지에 보일 데이터의 수 
	  int end = pageBlock * currentPage; //테이블에서 가져올 마지막 행번호 
	  int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호
	  
	  ArrayList<HotelDTO> hotels = hotelMapper.Main1_1(begin, end); 
	  int totalCount = hotelMapper.count(); 
	  String url = "hotellist?currentPage=";
	  String result = PageService.printPage(url, currentPage, totalCount,pageBlock);
	  
	  System.out.println("pageBlock " + pageBlock);
	  System.out.println("totalCount " + totalCount);

	  model.addAttribute("hotels", hotels); 
	  model.addAttribute("result", result);
	  model.addAttribute("currentPage", currentPage);
	  
	  
	  }
	  
	  
	
}