package com.care.stay.hotel;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.stay.reservation.ReservationDTO;

@Mapper
public interface HotelMapper {

	ArrayList<HotelDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int hotelroomcount();
	void stayregisterProc(HotelDTO hotel);
	HotelDTO stayContent(int no);
	HotelRoomDTO stayRoomContent(int no);
	HotelDTO stayDetailRegister(int no);
	void staydetailregisterProc(HotelRoomDTO hotelroom);
	int stayCountHotel();
	List<HotelRoomDTO> stayRoomContent(String n);
	
	 ArrayList<HotelDTO> hotellist( @Param("begin")int begin, @Param("end")int end); 
	 int count(); 
	 
	 // 지역선택
	 ArrayList<HotelDTO> Main(String selectedText, @Param("begin")int begin, @Param("end")int end); 
	 // 날짜선택
	 ArrayList<ReservationDTO> MainDate(String selectedText, String checkindate, String checkoutdate, @Param("begin")int begin, @Param("end")int end); 
	 // 지역날짜 선택
	// ArrayList<HotelDTO> Main(String selectedText, String checkindate, String checkoutdate, @Param("begin")int begin, @Param("end")int end); 
	 
	 
	 
	// ArrayList<HotelDTO> MainCheck(String selectedText, String checkindate, String checkoutdate, String htype, String hbedtype, String hcomfort, String hpeople, @Param("begin")int begin, @Param("end")int end);
	 //ArrayList<HotelDTO> MainCheck(String selectedText, String htype, String hbedtype, String hcomfort, String hpeople, @Param("begin")int begin, @Param("end")int end);
	 ArrayList<HotelDTO> MainCheck(String selectedText, String htype, String hbedtype, String hcomfort, String hpeople, @Param("begin")int begin, @Param("end")int end);
	// ArrayList<HotelRoomDTO> MainCheck(String selectedText, String htype, String hbedtype, String hcomfort, String hpeople, @Param("begin")int begin, @Param("end")int end);
	// ArrayList<HotelDTO> MainCheck(String selectedText, String htype, @Param("begin")int begin, @Param("end")int end);
	// ArrayList<HotelDTO> MainCheck(String selectedText, String hbedtype, String hcomfort, String hpeople, @Param("begin")int begin, @Param("end")int end);

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






