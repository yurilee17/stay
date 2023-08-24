package com.care.stay.pension;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import jakarta.servlet.http.HttpSession;

@Controller
public class PensionController {
	@Autowired
	private PensionService pservice;
	@Autowired
	private HttpSession session;

	@RequestMapping("pensionlist")
	public String pensionllist(

			@RequestParam(value = "currentPage", required = false) String cp, Model model) {

		System.out.println("pensionlist나오는지 알려주세요");

//	  hotelService.hotellist(cp,model); 
		return "pension/pensionlist";
	}

	// 뭔가를 선택했을 때 나오는 화면
	@RequestMapping("pensionMain")
	public String pensionMainCheck(

			@RequestParam(value = "currentPage", required = false) String cp,
			@RequestParam(value = "pdetailregion", required = false) String selectedText,
			@RequestParam(value = "checkindate", required = false) String checkindate,
			@RequestParam(value = "checkoutdate", required = false) String checkoutdate,
			@RequestParam(value = "ptype", required = false) String ptype,
			/* @RequestParam(value = "pbedtype", required = false) String pbedtype, */
			@RequestParam(value = "pcomfort", required = false) String pcomfort,
			@RequestParam(value = "ppeople", required = false) String ppeople, Model model) {

		System.out.println("selectedText: " + selectedText);
		System.out.println("ptype: " + ptype);
		/* System.out.println("hbedtype: " + hbedtype); */
		System.out.println("pcomfort: " + pcomfort);
		System.out.println("ppeople: " + ppeople);
		System.out.println("checkindate: " + checkindate);
		System.out.println("checkoutdate: " + checkoutdate);

		pservice.getAllPensionsWithMinPrices();

		if (ptype != null || pcomfort != null) {

			pservice.MainCheck(selectedText, checkindate, checkoutdate, ptype, pcomfort, ppeople, cp,
					model);
		} else {
			pservice.Main(selectedText, cp, model);
		}

		return "pension/pensionlist";
	}

	@RequestMapping("pensionpage")
	public String pensionpage(@RequestParam(value = "no", required = false) String n, Model model) {

		PensionDTO pension = pservice.stayContent2(n);
		List<PensionRoomDTO> pensionrooms = pservice.stayRoomContent(n);
		
		System.out.println(pension.getPimage());
		model.addAttribute("pension", pension);
		model.addAttribute("pensionrooms", pensionrooms);
		return "pension/pensionpage";
	}

//	@RequestMapping("pension")
//	public String guesthouse(Model model) {
//		pservice.pensionform(model);
//		return "board/pension";
//	}

}
