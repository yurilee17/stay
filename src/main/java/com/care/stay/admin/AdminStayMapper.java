package com.care.stay.admin;

import org.apache.ibatis.annotations.Mapper;
import com.care.stay.motel.MotelDTO;

@Mapper
public interface AdminStayMapper {
	
	void stayregisterProc(MotelDTO motel);

}