package com.care.stay.camping;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CampingMapper {

	int stayCountCamping();
	
}
