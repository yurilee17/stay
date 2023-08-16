package com.care.stay.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.stay.camping.CampingDTO;
import com.care.stay.camping.CampingMapper;
import com.care.stay.camping.CampingRoomDTO;
import com.care.stay.camping.CampingService;
import com.care.stay.gh.GHDTO;
import com.care.stay.gh.GHMapper;
import com.care.stay.gh.GHRoomDTO;
import com.care.stay.gh.GHService;
import com.care.stay.hotel.HotelDTO;
import com.care.stay.hotel.HotelMapper;
import com.care.stay.hotel.HotelRoomDTO;
import com.care.stay.hotel.HotelService;
import com.care.stay.motel.MotelDTO;
import com.care.stay.motel.MotelMapper;
import com.care.stay.motel.MotelRoomDTO;
import com.care.stay.motel.MotelService;
import com.care.stay.pension.PensionDTO;
import com.care.stay.pension.PensionRoomDTO;
import com.care.stay.pension.PensionMapper;
import com.care.stay.pension.PensionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminStayController {

	@Autowired private AdminStayService service;
	@Autowired private MotelService mservice;
	@Autowired private HotelService hservice;
	@Autowired private PensionService pservice;
	@Autowired private GHService gservice;
	@Autowired private CampingService cservice;
	@Autowired private MotelMapper motelMapper;
	@Autowired private HotelMapper hotelMapper;
	@Autowired private PensionMapper pensionMapper;
	@Autowired private GHMapper ghMapper;
	@Autowired private CampingMapper campingMapper;
	@Autowired private HttpSession session;

	@GetMapping("stayRegister")
	public String stayRegister(Model model,
		@RequestParam(value="stayType", required = false)String stayType) {
		return "admin/stayRegister";
	}


	/* 회원가입시 DB에서 데이터를 읽어온 다음 숙소코드를 표시함*/
	@GetMapping("getStayCode")
	@ResponseBody
	public String getStayCode(@RequestParam String stayType) {
	    int nextNo = service.getStayCount(stayType);
	    String stayCode = stayType.equals("motel") ? "M" :
	                    stayType.equals("hotel") ? "H" :
	                    stayType.equals("pension") ? "P" :
	                    stayType.equals("gh") ? "G" :
	                    stayType.equals("camping") ? "C" : "";
	    return stayCode + nextNo;
	}
	
	/* 숙소 상세 DB 페이지로 넘어가는 과정. 각 숙소별로 상세페이지가 조금씩 다른데다 
	   숙소 DB와 달리 종류는 정해진 상태이므로 If를 주고 페이지를 고정된 상태로 출력함 */

//	@GetMapping("stayDetailRegister")
//	public String stayDetailRegister(
//			@RequestParam(value="no", required = false)String n, 
//			Model model) {
//		
//		MotelDTO motel = service.stayContent(n);
//		if(motel == null)
//			return "redirect:stayInfo";
//		
//		model.addAttribute("motel", motel);
//		return "admin/stayDetailRegister";
//	}


	@RequestMapping("stayDetailRegister")
	public String stayDetailRegister(
			@RequestParam(value="no", required = false)String n,
			@RequestParam(value="stayType", required = false)String stayType,
			Model model) {
		
		if (stayType == null) {

			return "redirect:stayInfo";
	    } else if (stayType.equals("motel")) {
	    	MotelDTO motel = mservice.stayContent(n);
			session.setAttribute("no", motel.getNo());
			session.setAttribute("code", motel.getMcode());
			int roomcount = motelMapper.motelroomcount();
			model.addAttribute("stayType", stayType);
			model.addAttribute("motel", motel);
			model.addAttribute("mroomcode", roomcount);
	    } else if (stayType.equals("hotel")) {
	    	HotelDTO hotel = hservice.stayContent(n);
			session.setAttribute("no", hotel.getNo());
			session.setAttribute("code", hotel.getHcode());
			int roomcount = hotelMapper.hotelroomcount();
			model.addAttribute("stayType", stayType);
			model.addAttribute("hotel", hotel);
			model.addAttribute("hroomcode", roomcount);
	    } else if (stayType.equals("pension")) {
	    	PensionDTO pension = pservice.stayContent(n);
			session.setAttribute("no", pension.getNo());
			session.setAttribute("code", pension.getPcode());
			int roomcount = pensionMapper.pensionroomcount();
			model.addAttribute("stayType", stayType);
			model.addAttribute("pension", pension);
			model.addAttribute("proomcode", roomcount);
	    } else if (stayType.equals("gh")) {
	    	GHDTO gh = gservice.stayContent(n);
			session.setAttribute("no", gh.getNo());
			session.setAttribute("code", gh.getGcode());
			int roomcount = ghMapper.ghroomcount();
			model.addAttribute("stayType", stayType);
			model.addAttribute("gh", gh);
			model.addAttribute("groomcode", roomcount);
	    } else if (stayType.equals("camping")) {
	    	CampingDTO camping = cservice.stayContent(n);
			session.setAttribute("no", camping.getNo());
			session.setAttribute("code", camping.getCcode());
			int roomcount = campingMapper.campingroomcount();
			model.addAttribute("stayType", stayType);
			model.addAttribute("camping", camping);
			model.addAttribute("croomcode", roomcount);
	    } else {
	        return "redirect:stayInfo";
	    }
		return "admin/stayDetailRegister";
	}

	@GetMapping("stayModify")
	public String stayModify(
			@RequestParam(value="no", required = false)String n,
			@RequestParam(value="stayType", required = false)String stayType,
			Model model) {
		if (stayType == null) {
			return "redirect:stayInfo";
	    } else if (stayType.equals("motel")) {
	    	MotelDTO motel = mservice.stayContent(n);
			session.setAttribute("no", motel.getNo());
			session.setAttribute("code", motel.getMcode());
			model.addAttribute("stayType", stayType);
			model.addAttribute("motel", motel);
	    } else if (stayType.equals("hotel")) {
	    	HotelDTO hotel = hservice.stayContent(n);
			session.setAttribute("no", hotel.getNo());
			session.setAttribute("code", hotel.getHcode());
			model.addAttribute("stayType", stayType);
			model.addAttribute("hotel", hotel);
	    } else if (stayType.equals("pension")) {
	    	PensionDTO pension = pservice.stayContent(n);
			session.setAttribute("no", pension.getNo());
			session.setAttribute("code", pension.getPcode());
			model.addAttribute("stayType", stayType);
			model.addAttribute("pension", pension);
	    } else if (stayType.equals("gh")) {
	    	GHDTO gh = gservice.stayContent(n);
			session.setAttribute("no", gh.getNo());
			session.setAttribute("code", gh.getGcode());
			model.addAttribute("stayType", stayType);
			model.addAttribute("gh", gh);
	    } else if (stayType.equals("camping")) {
	    	CampingDTO camping = cservice.stayContent(n);
			session.setAttribute("no", camping.getNo());
			session.setAttribute("code", camping.getCcode());
			model.addAttribute("stayType", stayType);
			model.addAttribute("camping", camping);
	    } else {
	        return "redirect:stayInfo";
	    }
		return "admin/stayModify";
	}

	@GetMapping("stayDetailModify")
	public String stayDetailModify() {
		return "admin/stayDetailModify";
	}

	@RequestMapping("stayIndex")
	public String stayIndex() {
		return "admin/stayIndex";
	}

	@RequestMapping("stayContent")
	public String stayContent(
		@RequestParam(value="no", required = false)String n, 
		@RequestParam(value="stayType", required = false)String stayType,

		Model model) {
		
		if("motel".equals(stayType)) {
			MotelDTO motel = mservice.stayContent(n);
			List<MotelRoomDTO> motelrooms = mservice.stayRoomContent(n);

			if(motel == null) {
				System.out.println("stayContent 게시글 번호 : " + n);
				return "redirect:stayRegister";
			}
			model.addAttribute("stayType", stayType);
			model.addAttribute("motel", motel);
			model.addAttribute("motelrooms", motelrooms);
			return "admin/stayContent";
			
		} else if("hotel".equals(stayType)) {
			HotelDTO hotel = hservice.stayContent(n);
			List<HotelRoomDTO> hotelrooms = hservice.stayRoomContent(n);

			if(hotel == null) {
				System.out.println("stayContent 게시글 번호 : " + n);
				return "redirect:stayRegister";
			}
			model.addAttribute("stayType", stayType);
			model.addAttribute("hotel", hotel);
			model.addAttribute("hotelrooms", hotelrooms);
			return "admin/stayContent";
					
		} else if("pension".equals(stayType)) {
			PensionDTO pension = pservice.stayContent(n);
			List<PensionRoomDTO> pensionrooms = pservice.stayRoomContent(n);

			if(pension == null) {
				System.out.println("stayContent 게시글 번호 : " + n);
				return "redirect:stayRegister";
			}
			model.addAttribute("stayType", stayType);
			model.addAttribute("pension", pension);
			model.addAttribute("pensionrooms", pensionrooms);
			return "admin/stayContent";
			
		} else if("gh".equals(stayType)) {
			GHDTO gh = gservice.stayContent(n);
			List<GHRoomDTO> ghrooms = gservice.stayRoomContent(n);

			if(gh == null) {
				System.out.println("stayContent 게시글 번호 : " + n);
				return "redirect:stayRegister";
			}
			model.addAttribute("stayType", stayType);
			model.addAttribute("gh", gh);
			model.addAttribute("ghrooms", ghrooms);
			return "admin/stayContent";
			
		} else if("camping".equals(stayType)) {
			CampingDTO camping = cservice.stayContent(n);
			List<CampingRoomDTO> campingrooms = cservice.stayRoomContent(n);

			if(camping == null) {
				System.out.println("stayContent 게시글 번호 : " + n);
				return "redirect:stayRegister";
			}
			model.addAttribute("stayType", stayType);
			model.addAttribute("camping", camping);
			model.addAttribute("campingrooms", campingrooms);
			return "admin/stayContent";

		}

		return "admin/stayContent";
	}

	
	@PostMapping("stayregisterProc")
	public String stayregisterProc(MultipartHttpServletRequest multi, 
			@RequestParam("stayType") String stayType, Model model) {
		String result = "";
		if (stayType == null) {
	        result = "숙소 종류를 선택하세요.";
	    } else if (stayType.equals("motel")) {
	        result = mservice.stayregisterProc(multi);
	    } else if (stayType.equals("hotel")) {
	        result = hservice.stayregisterProc(multi);
	    } else if (stayType.equals("pension")) {
	        result = pservice.stayregisterProc(multi);
	    } else if (stayType.equals("gh")) {
	        result = gservice.stayregisterProc(multi);
	    } else if (stayType.equals("camping")) {
	        result = cservice.stayregisterProc(multi);
	    } else {
	        result = "숙소 종류가 적합하지 않습니다. 다시 입력하세요.";
	    }
		
		if (result.equals("숙소 DB 작성 완료")) {
	        return "redirect:stayInfo";
	    }
	    model.addAttribute("msg", result);
	    return "admin/stayregister";
	}
	

	@PostMapping("staydetailregisterProc")
	public String staydetailregisterProc(Model model, MultipartHttpServletRequest multi) {
		String stayType = multi.getParameter("stayType");
		String msg = "";
		
		if (stayType == null) {
	        msg = "숙소 종류를 선택하세요.";
	    } else if (stayType.equals("motel")) {
			msg = mservice.staydetailregisterProc(multi);
		} else if (stayType.equals("hotel")) {
			msg = hservice.staydetailregisterProc(multi);
		} else if (stayType.equals("pension")) {
			msg = pservice.staydetailregisterProc(multi);
		} else if (stayType.equals("gh")) {
			msg = gservice.staydetailregisterProc(multi);
		} else if (stayType.equals("camping")) {
			msg = cservice.staydetailregisterProc(multi);
		} else {
			msg = "숙소 종류가 적합하지 않습니다. 다시 입력하세요.";
		}

		if(msg.equals("객실 DB 작성 완료"))

			return "redirect:stayInfo";

		model.addAttribute("msg", msg);
		return "admin/stayDetailRegister";
	}
	
	@RequestMapping("stayInfo")
	public String stayInfo(
			@RequestParam(value="currentPage", required = false) String cp,
			@RequestParam(value="stayType", required = false) String stayType, 
			Model model) {
		
		if (stayType == null) {
			mservice.stayInfo(cp, stayType, model);
	    } else if (stayType.equals("motel")) {
	    	model.addAttribute("stayType", stayType);
	    	mservice.stayInfo(cp, stayType, model);
	    } else if (stayType.equals("hotel")) {
	    	model.addAttribute("stayType", stayType);
	    	hservice.stayInfo(cp, stayType, model);
	    } else if (stayType.equals("pension")) {
	    	model.addAttribute("stayType", stayType);
	    	pservice.stayInfo(cp, stayType, model);
	    } else if (stayType.equals("gh")) {
	    	model.addAttribute("stayType", stayType);
	    	gservice.stayInfo(cp, stayType, model);
	    } else if (stayType.equals("camping")) {
	    	model.addAttribute("stayType", stayType);
	    	cservice.stayInfo(cp, stayType, model);
	    } 
		return "admin/stayInfo";

	}

	
	@PostMapping("stayModifyProc")
	public String staymodifyProc(MultipartHttpServletRequest multi, 
			@RequestParam("stayType") String stayType, Model model) {
		String result = "";
		if (stayType == null) {
	        result = "숙소 종류를 선택하세요.";
	    } else if (stayType.equals("motel")) {
	        result = mservice.stayModifyProc(multi);
	    } else if (stayType.equals("hotel")) {
	        result = hservice.stayModifyProc(multi);
	    } else if (stayType.equals("pension")) {
	        result = pservice.stayModifyProc(multi);
	    } else if (stayType.equals("gh")) {
	        result = gservice.stayModifyProc(multi);
	    } else if (stayType.equals("camping")) {
	        result = cservice.stayModifyProc(multi);
	    } else {
	        result = "적합하지 않은 정보가 있습니다. 다시 입력하세요.";
	    }
		
		if (result.equals("숙소 DB 수정 완료")) {
	        return "redirect:stayInfo";
	    }
	    model.addAttribute("msg", result);
	    return "admin/stayregister";
	}


	// 회원 정보 조회
	@GetMapping("stayUser")
	public String stayUser(@RequestParam(value = "currentPage", required = false) String cp, String option1Name,
			String option1, String option2Name, String option2, Model model) {

		service.stayUser(cp, option1Name, option1, option2Name, option2, model);
		return "admin/stayUser";
	}

//	@ResponseBody
//	@PostMapping(value = "searchUser", produces = "text/plain; charset=utf-8")
//	public String searchUser(@RequestBody(required = false) String cp,
//			@RequestBody(required = false) String option1Name, @RequestBody(required = false) String option1,
//			@RequestBody(required = false) String option2Name, @RequestBody(required = false) String option2,
//			Model model) {
//
//		return service.searchUser(cp, option1Name, option1, option2Name, option2, model);
//	}


}
