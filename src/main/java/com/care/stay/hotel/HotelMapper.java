package com.care.stay.hotel;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HotelMapper {
	
	 ArrayList<HotelDTO> hotellist( @Param("begin")int begin, @Param("end")int end); 
	 int count(); 
	 
	 ArrayList<HotelDTO> Main1_1( @Param("begin")int begin, @Param("end")int end); 


	/*
	 * ArrayList<HotelDTO> hotellist(
	 * 
	 * @Param("begin")int begin, @Param("end")int end,
	 * 
	 * @Param("mainMenu")String mainMenu, @Param("subMenu")String subMenu);
	 * 
	 * int count(@Param("select")String select, @Param("search")String search);
	 */
	 
	
	

	
}






