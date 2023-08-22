package com.care.stay.inquiry;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

/*
  	CREATE TABLE inquiryForm (
    id NUMBER PRIMARY KEY,
    category_type VARCHAR2(100),
    name VARCHAR2(100),
    phone_number VARCHAR2(20),
    email VARCHAR2(100),
    content CLOB,
    created_at TIMESTAMP
	);
	
	
	CREATE TABLE inquiryForm (
  inquiryno INT(10000) AUTO_INCREMENT,
  id VARCHAR(100),
  phone_number VARCHAR(20),
  category_type VARCHAR(100),
  content VARCHAR(500),
  created_at TIMESTAMP,
  PRIMARY KEY (inquiryno),
  FOREIGN KEY (id) REFERENCES {참조할_테이블명}({참조할_컬럼명})
  );
  
*/

@Service
public class InquiryService {

    private final InquiryMapper inquiryMapper;

    @Autowired
    public InquiryService(InquiryMapper inquiryMapper) {
        this.inquiryMapper = inquiryMapper;
    }

    public void insertInquiry(InquiryDTO inquiry) {
        inquiryMapper.insertInquiry(inquiry);
    }

    public InquiryDTO getInquiryById(int id) {
        return inquiryMapper.selectInquiryById(id);
    }

    public List<InquiryDTO> getAllInquiries() {
        return inquiryMapper.selectAllInquiries();
    }

	public void inquiryForm(String cp, Model model) {
		// TODO Auto-generated method stub
		
	}
}

