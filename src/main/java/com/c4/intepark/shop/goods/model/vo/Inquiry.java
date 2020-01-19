package com.c4.intepark.shop.goods.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Inquiry implements Serializable{
	private static final long serialVersionUID = 4005L;

	private int inquirynum;
	private String inquirycn; 
	private int inquirytype; 
	private String inquirytitle; 
	private String secretat; 
	private Date inquirydate;
	private String answersttus; 
	private String userid; 
	private int goodsnum;
	private String refile;
	public String getRefile() {
		return refile;
	}
	public void setRefile(String refile) {
		this.refile = refile;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Inquiry() {
		super();
	}
	public Inquiry(int inquirynum, String inquirycn, int inquirytype, String inquirytitle, String secretat,
			Date inquirydate, String answersttus, String userid, int goodsnum) {
		super();
		this.inquirynum = inquirynum;
		this.inquirycn = inquirycn;
		this.inquirytype = inquirytype;
		this.inquirytitle = inquirytitle;
		this.secretat = secretat;
		this.inquirydate = inquirydate;
		this.answersttus = answersttus;
		this.userid = userid;
		this.goodsnum = goodsnum;
	}
	public int getInquirynum() {
		return inquirynum;
	}
	public void setInquirynum(int inquirynum) {
		this.inquirynum = inquirynum;
	}
	public String getInquirycn() {
		return inquirycn;
	}
	public void setInquirycn(String inquirycn) {
		this.inquirycn = inquirycn;
	}
	public int getInquirytype() {
		return inquirytype;
	}
	public void setInquirytype(int inquirytype) {
		this.inquirytype = inquirytype;
	}
	public String getInquirytitle() {
		return inquirytitle;
	}
	public void setInquirytitle(String inquirytitle) {
		this.inquirytitle = inquirytitle;
	}
	public String getSecretat() {
		return secretat;
	}
	public void setSecretat(String secretat) {
		this.secretat = secretat;
	}
	public Date getInquirydate() {
		return inquirydate;
	}
	public void setInquirydate(Date inquirydate) {
		this.inquirydate = inquirydate;
	}
	public String getAnswersttus() {
		return answersttus;
	}
	public void setAnswersttus(String answersttus) {
		this.answersttus = answersttus;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	@Override
	public String toString() {
		return "Inquiry [inquirynum=" + inquirynum + ", inquirycn=" + inquirycn + ", inquirytype=" + inquirytype
				+ ", inquirytitle=" + inquirytitle + ", secretat=" + secretat + ", inquirydate=" + inquirydate
				+ ", answersttus=" + answersttus + ", userid=" + userid + ", goodsnum=" + goodsnum + "]";
	}
	
	
	
	
}
