package com.care.stay.inquiry;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface InquiryMapper {

    @Insert("INSERT INTO inquiryForm(category_type, name, phone_number, email, content, created_at) " +
            "VALUES (#{categoryType}, #{name}, #{phoneNumber}, #{email}, #{content}, #{created_At})")
    void insertInquiry(InquiryDTO inquiry);

    @Select("SELECT ROW_NUMBER() OVER (ORDER BY created_at DESC) AS rno,content,id,created_at FROM inquiryForm WHERE id = #{id} ORDER BY created_at DESC")
    InquiryDTO selectInquiryById(@Param("id") Long id);

    @Select("SELECT * FROM inquiryForm")
    List<InquiryDTO> selectAllInquiries();
}

