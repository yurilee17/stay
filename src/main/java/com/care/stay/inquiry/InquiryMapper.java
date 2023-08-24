package com.care.stay.inquiry;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InquiryMapper {
	// 문의사항 데이터를 추가하는 메서드
    int insertInquiry(InquiryDTO inquiry);

    // 주어진 id에 해당하는 문의사항 데이터를 조회하는 메서드
    InquiryDTO selectInquiryById(int id);

    // 모든 문의사항 데이터를 조회하는 메서드
    List<InquiryDTO> selectAllInquiries();

    // 문의사항 데이터를 수정하는 메서드
    int updateInquiry(InquiryDTO inquiry);
    
    // 주어진 id에 해당하는 문의사항 데이터를 삭제하는 메서드
    int deleteInquiry(int id);
    
    // 주어진 categoryType에 해당하는 문의사항 데이터를 조회하는 메서드
    List<InquiryDTO> selectInquiriesByCategoryType(int categoryType);
}
	