package com.care.stay.hotel;

import java.util.List;

public class HotelParameters {
	
    private String selectedText;
    private List<String> htype;
    private List<String> hbedtype;
    private List<String> hcomfort;
    private int hpeople;
	public String getSelectedText() {
		return selectedText;
	}
	public void setSelectedText(String selectedText) {
		this.selectedText = selectedText;
	}
	public List<String> getHtype() {
		return htype;
	}
	public void setHtype(List<String> htype) {
		this.htype = htype;
	}
	public List<String> getHbedtype() {
		return hbedtype;
	}
	public void setHbedtype(List<String> hbedtype) {
		this.hbedtype = hbedtype;
	}
	public List<String> getHcomfort() {
		return hcomfort;
	}
	public void setHcomfort(List<String> hcomfort) {
		this.hcomfort = hcomfort;
	}
	public int getHpeople() {
		return hpeople;
	}
	public void setHpeople(int hpeople) {
		this.hpeople = hpeople;
	}
    
    
}