package com.care.stay.hotel;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HotelMapper {

	ArrayList<HotelDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int hotelroomcount();
	void stayregisterProc(HotelDTO hotel);
	HotelDTO stayContent(int no);
	HotelRoomDTO stayRoomContent(int no);
	HotelDTO stayDetailRegister(int no);
	HotelRoomDTO stayReservation(int roomcode);
	void staydetailregisterProc(HotelRoomDTO hotelroom);
	int stayCountHotel();
	List<HotelRoomDTO> stayRoomContent(String n);
	
	 ArrayList<HotelDTO> hotellist( @Param("begin")int begin, @Param("end")int end); 
	 int count(); 
	 
	 ArrayList<HotelDTO> Main(String selectedText, @Param("begin")int begin, @Param("end")int end); 
	 
	ArrayList<HotelDTO> MainCheck(String selectedText, String selectedValues1, String selectedValues2, String selectedValues3, int personCount, @Param("begin")int begin, @Param("end")int end);


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






