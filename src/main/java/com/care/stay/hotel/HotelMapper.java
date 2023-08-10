package com.care.stay.hotel;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HotelMapper {
	ArrayList<HotelDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();
	int hotelroomcount();
	void stayregisterProc(HotelDTO hotel);
	HotelDTO stayContent(int no);
	HotelRoomDTO stayRoomContent(int no);
	HotelDTO stayDetailRegister(int no);
	void staydetailregisterProc(HotelRoomDTO hotelroom);
	int stayCountHotel();
	List<HotelRoomDTO> stayRoomContent(String n);

}
