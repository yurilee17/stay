package com.care.stay.admin;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.camping.CampingMapper;
import com.care.stay.common.PageService;
import com.care.stay.gh.GHMapper;
import com.care.stay.hotel.HotelDTO;
import com.care.stay.hotel.HotelMapper;
import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelMapper;
import com.care.stay.motel.MotelRoomDTO;
import com.care.stay.pension.PensionMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminStayService {
	@Autowired private AdminStayMapper adminStayMapper;
	@Autowired private MotelMapper motelMapper;
	@Autowired private HotelMapper hotelMapper;
	@Autowired private PensionMapper pensionMapper;
	@Autowired private GHMapper ghMapper;
	@Autowired private CampingMapper campingMapper;
	@Autowired private HttpSession session;
	
	/* 각 테이블에 저장된 no칼럼값의 최대값 + 1을 가져오는*/
	public int getStayCount(String stayType) {
	    if (stayType.equals("motel")) {
	        return motelMapper.stayCountMotel();
	    } else if (stayType.equals("hotel")) {
	        return hotelMapper.stayCountHotel();
	    } else if (stayType.equals("pension")) {
	        return pensionMapper.stayCountPension();
	    } else if (stayType.equals("gh")) {
	        return ghMapper.stayCountGuestHouse();
	    } else if (stayType.equals("camping")) {
	        return campingMapper.stayCountCamping();
	    } else {
	        return 0;
	    }
	}
	
}
