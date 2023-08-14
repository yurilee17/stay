package com.care.stay.gh;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface GHMapper {
	ArrayList<GHDTO> stayInfo(@Param("begin")int begin, @Param("end")int end);
	int count();	
	int ghroomcount();	
	void stayregisterProc(GHDTO gh);
	GHDTO stayContent(int no);
	GHRoomDTO stayRoomContent(int no);
	GHDTO stayDetailREgister(int no);
	void staydetailregisterProc(GHRoomDTO ghroom);
	int stayCountGuestHouse();	
	List<GHRoomDTO> stayRoomContent(String n);	
}
