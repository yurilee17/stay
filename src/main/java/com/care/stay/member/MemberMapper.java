package com.care.stay.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.stay.member.MemberDTO;

@Mapper
public interface MemberMapper {

	MemberDTO loginProc(String id);
	
	MemberDTO serchNickname(String nickname);
	
	void registerProc(MemberDTO member);
	
	MemberDTO getMobile(String id);
	
	void passwdReset(MemberDTO member);
	
	// 검색된 부분의 전체 갯수
	int countAll();
	
	int count1(String optionName, String option);
	
	int count2(String option1Name, String option1,  String option2Name, String option2);
	
	//
	ArrayList<MemberDTO> stayUser(@Param("begin")int begin, @Param("end")int end);
}
