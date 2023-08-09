package com.care.stay.camping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CampingMapper {

	int stayCountCamping();
	int count();
	ArrayList<CampingDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	
}
