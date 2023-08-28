package com.care.stay.hotel;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.stay.reservation.ReservationDTO;

@Mapper
public interface HotelMapper {
	
	HotelRoomDTO roomContent(int no);

	ArrayList<HotelDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int hotelroomcount();
	void stayregisterProc(HotelDTO hotel);
	HotelDTO stayContent(int no);
	HotelRoomDTO stayRoomContent(int hroomcode);
	HotelDTO stayDetailRegister(int no);
	HotelRoomDTO stayReservation(int hroomcode);
	void staydetailregisterProc(HotelRoomDTO hotelroom);
	int stayCountHotel();
	List<HotelRoomDTO> stayRoomContent(String n);
	
	 ArrayList<HotelDTO> hotellist( @Param("begin")int begin, @Param("end")int end); 
	 int count(); 
	 
	
	 ArrayList<HotelDTO> Main(String selectedText, @Param("begin")int begin, @Param("end")int end); 
 	 ArrayList<HotelDTO> MainCheck(String selectedText, String htype, String hbedtype, String hcomfort, String hpeople, @Param("begin")int begin, @Param("end")int end);

 	 int resNum(String hcode, int no, int hroomcode, String checkindate, String checkoutdate);
 	 

}