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
	GHRoomDTO roomContent(int groomcode);
	
	List<GHDTO> getAllGHs();
	int findMinPriceByGuestHouse(int no);
	void updatePrices(GHDTO gh);
	
	ArrayList<GHDTO> MainCheck(String selectedText, String gbedtype, String gcomfort, String gpeople, @Param("begin")int begin, @Param("end")int end);
	int resNum(String gcode, int no, int groomcode, String checkindate, String checkoutdate);
	ArrayList<GHDTO> Main(String selectedText, @Param("begin")int begin, @Param("end")int end);

	
	
}

