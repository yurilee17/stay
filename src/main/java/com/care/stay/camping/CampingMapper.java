package com.care.stay.camping;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CampingMapper {
	ArrayList<CampingDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();
	int campingroomcount();
	void stayregisterProc(CampingDTO camping);
	CampingDTO stayContent(int no);
	CampingRoomDTO stayRoomContent(int no);
	CampingDTO stayDetailRegister(int no);
	void staydetailregisterProc(CampingRoomDTO campingroom);
	int stayCountCamping();	
	List<CampingRoomDTO> stayRoomContent(String n);
}
