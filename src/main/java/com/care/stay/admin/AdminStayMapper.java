package com.care.stay.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.stay.motel.MotelDTO;

@Mapper
public interface AdminStayMapper {
	void stayregisterProc(MotelDTO motel);
	int count();
	ArrayList<MotelDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);

}