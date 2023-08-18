package com.care.stay.reservation;

public class ReservationDTO {
	private int no; //일련번호
	private int stayno; //숙소번호
	private String stayname; //숙소이름
	private String roomname; //객실이름
	private String code; //숙소코드
	private String roomcode; //객실코드
	private String roomimage; //객실이미지
	private String checkindate; //체크인날짜
	private String checkoutdate; //체크아웃날짜
	private String checkintime; //입실시간
	private String checkouttime; //퇴실시간
	private String id; //아이디
	private String name; //이름
	private int price; //가격
	private String paymethod; //결제방법
	private String status; //예약상태

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStayno() {
		return stayno;
	}
	public void setStayno(int stayno) {
		this.stayno = stayno;
	}
	public String getStayname() {
		return stayname;
	}
	public void setStayname(String stayname) {
		this.stayname = stayname;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(String roomcode) {
		this.roomcode = roomcode;
	}
	public String getRoomimage() {
		return roomimage;
	}
	public void setRoomimage(String roomimage) {
		this.roomimage = roomimage;
	}
	public String getCheckindate() {
		return checkindate;
	}
	public void setCheckindate(String checkindate) {
		this.checkindate = checkindate;
	}
	public String getCheckoutdate() {
		return checkoutdate;
	}
	public void setCheckoutdate(String checkoutdate) {
		this.checkoutdate = checkoutdate;
	}
	public String getCheckintime() {
		return checkintime;
	}
	public void setCheckintime(String checkintime) {
		this.checkintime = checkintime;
	}
	public String getCheckouttime() {
		return checkouttime;
	}
	public void setCheckouttime(String checkouttime) {
		this.checkouttime = checkouttime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
