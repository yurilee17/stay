package com.care.stay.hotel;

import java.util.List;

public class HotelDTO {
	
	private int no;
	private String hcode;
	private String hname;
	private String hregion;

//	private String hdetailRegion;
//	private int hrating;
//	private String haddress;
//	private String hdetailAddress;
//	private String himage;
//	private String hinfo;
//	private String hcheckInTime;
//	private String hcheckOutTime;
//	private String htype;

	private String hdetailregion;
	private int hrating;
	private String haddress;
	private String hdetailaddress;
	private String himage;
	private String hinfo;
	private String hcheckintime;
	private String hcheckouttime;
	private String htype;
	private List<HotelRoomDTO> rooms;

	
	public List<HotelRoomDTO> getRooms() {
		return rooms;
	}
	public void setRooms(List<HotelRoomDTO> rooms) {
		this.rooms = rooms;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getHcode() {
		return hcode;
	}
	public void setHcode(String hcode) {
		this.hcode = hcode;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHregion() {
		return hregion;
	}
	public void setHregion(String hregion) {
		this.hregion = hregion;
	}

	public String getHdetailregion() {
		return hdetailregion;
	}

	public void setHdetailregion(String hdetailregion) {
		this.hdetailregion = hdetailregion;

	}
	public int getHrating() {
		return hrating;
	}
	public void setHrating(int hrating) {
		this.hrating = hrating;
	}
	public String getHaddress() {
		return haddress;
	}
	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}

	public String getHdetailaddress() {
		return hdetailaddress;

	}

	public void setHdetailaddress(String hdetailaddress) {
		this.hdetailaddress = hdetailaddress;

	}
	public String getHimage() {
		return himage;
	}
	public void setHimage(String himage) {
		this.himage = himage;
	}
	public String getHinfo() {
		return hinfo;
	}
	public void setHinfo(String hinfo) {
		this.hinfo = hinfo;
	}

	public String getHcheckintime() {
		return hcheckintime;

	}

	public void setHcheckintime(String hcheckintime) {
		this.hcheckintime = hcheckintime;

	}


	public String getHcheckouttime() {
		return hcheckouttime;

	}

	public void setHcheckouttime(String hcheckouttime) {
		this.hcheckouttime = hcheckouttime;

	}
	public String getHtype() {
		return htype;
	}
	public void setHtype(String htype) {
		this.htype = htype;
	}


}

