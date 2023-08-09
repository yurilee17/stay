package com.care.stay.gh;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface GHMapper {

	int stayCountGuestHouse();

	ArrayList<GHDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();

	void stayregisterProc(GHDTO gh);	
	
}
