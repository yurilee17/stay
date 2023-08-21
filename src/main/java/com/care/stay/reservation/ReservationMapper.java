package com.care.stay.reservation;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {
	
	int reservationcount();
	void reservationProc(ReservationDTO reservation);

}
