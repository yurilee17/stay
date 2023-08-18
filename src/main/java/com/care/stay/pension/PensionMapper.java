package com.care.stay.pension;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PensionMapper {
	ArrayList<PensionDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();
	int pensionroomcount();	
	void stayregisterProc(PensionDTO pension);
	PensionDTO stayContent(int no);
	PensionRoomDTO stayRoomContent(int no);
	PensionDTO stayDetailRegister(int no);
	void staydetailregisterProc(PensionRoomDTO pensionroom);
	int stayCountPension();
	List<PensionRoomDTO> stayRoomContent(String n);
	PensionRoomDTO roomContent(int no);
}
