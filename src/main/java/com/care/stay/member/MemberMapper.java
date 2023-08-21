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
	
	void updateNickname(MemberDTO member);
	
	void updateName(MemberDTO member);
	
	void updateMobile(MemberDTO member);
	
	void delete(MemberDTO member);

	int count(@Param("option1Name") String option1Name, @Param("option1") String option1,
			@Param("option2Name") String option2Name, @Param("option2") String option2);

	ArrayList<MemberDTO> stayUser(@Param("begin") int begin, @Param("end") int end,
			@Param("option1Name") String option1Name, @Param("option1") String option1,
			@Param("option2Name") String option2Name, @Param("option2") String option2);

//	ArrayList<MemberDTO> list(@Param("begin") int begin, @Param("end") int end, @Param("select") String select,
//			@Param("search") String search);

//	int count(@Param("select") String select, @Param("search") String search);
	
	
}
