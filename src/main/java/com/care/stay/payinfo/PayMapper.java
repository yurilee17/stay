package com.care.stay.payinfo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayMapper {

	void payInfoProc(PayInfoDTO payInfoDTO);

}
