package com.care.stay.reservation;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReservationMapper {

	int reservationcount();

	void reservationProc(ReservationDTO reservation);

	// 리스트 가져오기 전 업데이트
	void listUp();
	
	// 예약확정 가져오기
	ArrayList<ReservationDTO> resConfirmed(String id);

	// 이용완료 가져오기
	ArrayList<ReservationDTO> resCompleted(String id);

	// 예약취소 가져오기
	ArrayList<ReservationDTO> resCancellation(String id);

	// 예약 삭제
	void delete(int no);

	// 예약 상세 가져오기
	ReservationDTO resDetail(int no);
	
	// 예약 취소하기
	void resUpdate(int no);

}
