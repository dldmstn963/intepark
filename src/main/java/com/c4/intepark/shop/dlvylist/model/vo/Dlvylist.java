package com.c4.intepark.shop.dlvylist.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Dlvylist implements Serializable{
	private static final long serialVersionUID = 4003L;

	private int dlvynum; 
	private String addressee; 
	private String address; 
	private int phone; 
	private String dlvyname; 
	private String userid;
	public Dlvylist() {
		super();
	}
	public Dlvylist(int dlvynum, String addressee, String address, int phone, String dlvyname, String userid) {
		super();
		this.dlvynum = dlvynum;
		this.addressee = addressee;
		this.address = address;
		this.phone = phone;
		this.dlvyname = dlvyname;
		this.userid = userid;
	}
	public int getDlvynum() {
		return dlvynum;
	}
	public void setDlvynum(int dlvynum) {
		this.dlvynum = dlvynum;
	}
	public String getAddressee() {
		return addressee;
	}
	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getDlvyname() {
		return dlvyname;
	}
	public void setDlvyname(String dlvyname) {
		this.dlvyname = dlvyname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "Dlvylist [dlvynum=" + dlvynum + ", addressee=" + addressee + ", address=" + address + ", phone=" + phone
				+ ", dlvyname=" + dlvyname + ", userid=" + userid + "]";
	}
}
