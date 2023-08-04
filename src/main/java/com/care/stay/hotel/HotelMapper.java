package com.care.stay.hotel;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HotelMapper {

	ArrayList<HotelDTO> hotellist(@Param("begin")int begin, @Param("end")int end);

	int count();

}






