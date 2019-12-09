package com.c4.intepark.auction.model.vo;

import java.sql.Date;

public class Auction {
private int auctionno;
private String auctionsection;
private String interiorsection;
private String title;
private String name;
private String price;
private String phone;
private java.sql.Date startday;
private String address;
private String ofile;
private String rfile;
private String etc;
private String progress;
private String userid;

public Auction() {}

public Auction(int auctionno, String auctionsection, String interiorsection, String title, String name, String price,
		String phone, Date startday, String address, String ofile, String rfile, String etc, String progress,
		String userid) {
	super();
	this.auctionno = auctionno;
	this.auctionsection = auctionsection;
	this.interiorsection = interiorsection;
	this.title = title;
	this.name = name;
	this.price = price;
	this.phone = phone;
	this.startday = startday;
	this.address = address;
	this.ofile = ofile;
	this.rfile = rfile;
	this.etc = etc;
	this.progress = progress;
	this.userid = userid;
}

@Override
public String toString() {
	return "Auction [auctionno=" + auctionno + ", auctionsection=" + auctionsection + ", interiorsection="
			+ interiorsection + ", title=" + title + ", name=" + name + ", price=" + price + ", phone=" + phone
			+ ", startday=" + startday + ", address=" + address + ", ofile=" + ofile + ", rfile=" + rfile + ", etc="
			+ etc + ", progress=" + progress + ", userid=" + userid + "]";
}

public int getAuctionno() {
	return auctionno;
}

public void setAuctionno(int auctionno) {
	this.auctionno = auctionno;
}

public String getAuctionsection() {
	return auctionsection;
}

public void setAuctionsection(String auctionsection) {
	this.auctionsection = auctionsection;
}

public String getInteriorsection() {
	return interiorsection;
}

public void setInteriorsection(String interiorsection) {
	this.interiorsection = interiorsection;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public java.sql.Date getStartday() {
	return startday;
}

public void setStartday(java.sql.Date startday) {
	this.startday = startday;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getOfile() {
	return ofile;
}

public void setOfile(String ofile) {
	this.ofile = ofile;
}

public String getRfile() {
	return rfile;
}

public void setRfile(String rfile) {
	this.rfile = rfile;
}

public String getEtc() {
	return etc;
}

public void setEtc(String etc) {
	this.etc = etc;
}

public String getProgress() {
	return progress;
}

public void setProgress(String progress) {
	this.progress = progress;
}

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

}
