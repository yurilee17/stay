package com.care.stay.pension;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.stay.hotel.HotelDTO;

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
	
	//리스트 보여지기 전에 최저가 가져와서 DB 없데이트
	List<PensionDTO> getAllpensions();
	int findMinPriceByPension(int no);
	void updatePrices(PensionDTO pension);
	
	// 지역만 선택 시 펜션리스트 
	ArrayList<PensionDTO> Main(String selectedText, @Param("begin")int begin, @Param("end")int end); 
	
	// 체크박스 선택시 조건에 맞게 펜션리스트
	ArrayList<PensionDTO> MainCheck(String selectedText, String ptype, String pcomfort, String ppeople, @Param("begin")int begin, @Param("end")int end);
	int resNum(String pcode, int no, int proomcode, String checkindate, String checkoutdate);

	// 상세 페이지 진입
	PensionDTO stayContent2(int no);
}
