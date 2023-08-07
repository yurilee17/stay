package com.care.stay.hotel;


import org.apache.ibatis.annotations.Mapper;

import com.care.stay.hotel.HotelDTO;


@Mapper
public interface HotelMapper {

	int stayCountHotel();
	void stayregisterProc(HotelDTO hotel);
	
}
