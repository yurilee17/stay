package com.care.stay.hotel;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.stay.hotel.HotelDTO;
import com.care.stay.motel.MotelDTO;


@Mapper
public interface HotelMapper {
	
	ArrayList<HotelDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();
	void stayregisterProc(HotelDTO hotel);
	int stayCountHotel();
	int hotelroomcount();
	void staydetailregisterProc(HotelRoomDTO hotelroom);

	
	
}
