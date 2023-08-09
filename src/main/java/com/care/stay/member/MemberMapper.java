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

}
