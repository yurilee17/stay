package com.care.stay.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelRoomDTO;

@Mapper
public interface AdminStayMapper {
	ArrayList<MotelDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();
	void stayregisterProc(MotelDTO motel);
	MotelDTO stayContent(int no);
	MotelDTO stayDetailRegister(int no);
	void staydetailregisterProc(MotelRoomDTO motelroom);
	
}

