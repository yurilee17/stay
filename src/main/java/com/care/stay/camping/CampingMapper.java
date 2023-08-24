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
	CampingRoomDTO roomContent(int croomcode);
	
	 ArrayList<CampingDTO> Main(String selectedText, @Param("begin")int begin, @Param("end")int end); 
 	 ArrayList<CampingDTO> MainCheck(String selectedText, String ctype, String ccomfort, String cpeople, @Param("begin")int begin, @Param("end")int end);
 	 
 	 List<CampingDTO> getAllCampings();
 	 int findMinPriceByCamping(int no);

  	 int resNum(String code, int no, int croomcode, String checkindate, String checkoutdate);

 	void updatePrices(CampingDTO camping);
	
	
}
