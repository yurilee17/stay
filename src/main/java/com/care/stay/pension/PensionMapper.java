package com.care.stay.pension;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PensionMapper {

	int stayCountPension();
	ArrayList<PensionDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();
	void stayregisterProc(PensionDTO pension);
	
}
