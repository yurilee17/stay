package com.care.stay.pension;

public class PensionDTO {
	
	private int no;
	private String pcode;
	private String pname;
	private String pregion;
	private String pdetailregion;
	private int prating;
	private String paddress;
	private String pdetailaddress;
	private String pimage;
	private String pinfo;
	private String pcheckintime;
	private String pcheckouttime;
	private String ptype;
	private int minprice;
	
	private PensionRoomDTO rooms;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPregion() {
		return pregion;
	}

	public void setPregion(String pregion) {
		this.pregion = pregion;
	}

	public String getPdetailregion() {
		return pdetailregion;
	}

	public void setPdetailregion(String pdetailregion) {
		this.pdetailregion = pdetailregion;
	}

	public int getPrating() {
		return prating;
	}

	public void setPrating(int prating) {
		this.prating = prating;
	}

	public String getPaddress() {
		return paddress;
	}

	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}

	public String getPdetailaddress() {
		return pdetailaddress;
	}

	public void setPdetailaddress(String pdetailaddress) {
		this.pdetailaddress = pdetailaddress;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getPinfo() {
		return pinfo;
	}

	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}

	public String getPcheckintime() {
		return pcheckintime;
	}

	public void setPcheckintime(String pcheckintime) {
		this.pcheckintime = pcheckintime;
	}

	public String getPcheckouttime() {
		return pcheckouttime;
	}

	public void setPcheckouttime(String pcheckouttime) {
		this.pcheckouttime = pcheckouttime;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public int getMinprice() {
		return minprice;
	}

	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}

	public PensionRoomDTO getRooms() {
		return rooms;
	}

	public void setRooms(PensionRoomDTO rooms) {
		this.rooms = rooms;
	}

	

}
