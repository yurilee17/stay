package com.care.stay.motel;

public class MotelDTO {
	private int no;
	private String mcode;
	private String mname;
	private String mregion;
	private String mdetailRegion;
	private String mdaesilPrice;
	private String mstayPrice;
	private int mrating;
	private String maddress;
	private String mdetailAddress;
	private String mimage;
	private String minfo;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMdetailAddress() {
		return mdetailAddress;
	}
	public void setMdetailAddress(String mdetailAddress) {
		this.mdetailAddress = mdetailAddress;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMregion() {
		return mregion;
	}
	public void setMregion(String mregion) {
		this.mregion = mregion;
	}
	public String getMdetailRegion() {
		return mdetailRegion;
	}
	public void setMdetailRegion(String mdetailRegion) {
		this.mdetailRegion = mdetailRegion;
	}
	public String getMdaesilprice() {
		return mdaesilPrice;
	}
	public void setMdaesilprice(String mdaesilprice) {
		this.mdaesilPrice = mdaesilprice;
	}
	public String getMstayprice() {
		return mstayPrice;
	}
	public void setMstayprice(String mstayprice) {
		this.mstayPrice = mstayprice;
	}
	public Number getMrating() {
		return mrating;
	}
	public void setMrating(int mrating) {
		this.mrating = mrating;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMimage() {
		return mimage;
	}
	public void setMimage(String mimage) {
		this.mimage = mimage;
	}
	public String getMinfo() {
		return minfo;
	}
	public void setMinfo(String minfo) {
		this.minfo = minfo;
	}

}
