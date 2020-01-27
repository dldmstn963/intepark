package com.c4.intepark.auction.model.vo;

import java.sql.Date;

public class AuctionAttend implements java.io.Serializable{
	private static final long serialVersionUID = 2005L;
private int auctionno;
private String consid;
private String consname;
private String title;
private String phone;
private java.sql.Date possibledate;
private String price;
private String ofile;
private String rfile;
private String etc;
private String progress;
private String panorama;
private String userid;

public AuctionAttend() {}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}


public String getPanorama() {
	return panorama;
}
public void setPanorama(String panorama) {
	this.panorama = panorama;
}
@Override
public String toString() {
	return "AuctionAttend [auctionno=" + auctionno + ", consid=" + consid + ", consname=" + consname + ", title="
			+ title + ", phone=" + phone + ", possibledate=" + possibledate + ", price=" + price + ", ofile=" + ofile
			+ ", rfile=" + rfile + ", etc=" + etc + ", progress=" + progress + ", panorama=" + panorama + ", userid="
			+ userid + ", getUserid()=" + getUserid() + ", getAuctionno()=" + getAuctionno() + ", getConsid()="
			+ getConsid() + ", getConsname()=" + getConsname() + ", getTitle()=" + getTitle() + ", getPhone()="
			+ getPhone() + ", getPossibledate()=" + getPossibledate() + ", getPrice()=" + getPrice() + ", getOfile()="
			+ getOfile() + ", getRfile()=" + getRfile() + ", getEtc()=" + getEtc() + ", getProgress()=" + getProgress()
			+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}
public AuctionAttend(int auctionno, String consid, String consname, String title, String phone, Date possibledate,
		String price, String ofile, String rfile, String etc, String progress, String panorama, String userid) {
	super();
	this.auctionno = auctionno;
	this.consid = consid;
	this.consname = consname;
	this.title = title;
	this.phone = phone;
	this.possibledate = possibledate;
	this.price = price;
	this.ofile = ofile;
	this.rfile = rfile;
	this.etc = etc;
	this.progress = progress;
	this.panorama = panorama;
	this.userid = userid;
}
public int getAuctionno() {
	return auctionno;
}
public void setAuctionno(int auctionno) {
	this.auctionno = auctionno;
}
public String getConsid() {
	return consid;
}
public void setConsid(String consid) {
	this.consid = consid;
}
public String getConsname() {
	return consname;
}
public void setConsname(String consname) {
	this.consname = consname;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public java.sql.Date getPossibledate() {
	return possibledate;
}
public void setPossibledate(java.sql.Date possibledate) {
	this.possibledate = possibledate;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
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
public static long getSerialversionuid() {
	return serialVersionUID;
}

}
