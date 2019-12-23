package com.c4.intepark.review.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Review implements java.io.Serializable {
	private static final long serialVersionUID = 5300L;
	
	private int rvnum;	//리뷰번호
	private int rvkind;	//친절도
	private int rvprice;	//시공가격
	private int rvquality;		//퀄리티
	private int rvprofessional;	//전문성
	private int rvresponsible;	//책임감
	private String rvperiod;	//시공시기
	private String rvregion;	//시공지역
	private String rvbuildingtype;	//건물유형
	private String rvarea;	//시공분야
	private String rvspacious;	//시공평수
	private String rvprice2;	//시공가격
	private String rvcritique;	//총평
	private java.sql.Date rvdate;	//리뷰작성날짜
	private String consid;	//시공사 아이디
	private String userid;	//고객아이디
	
	public Review() {}

	public Review(int rvnum, int rvkind, int rvprice, int rvquality, int rvprofessional, int rvresponsible,
			String rvperiod, String rvregion, String rvbuildingtype, String rvarea, String rvspacious, String rvprice2,
			String rvcritique, Date rvdate, String consid, String userid) {
		super();
		this.rvnum = rvnum;
		this.rvkind = rvkind;
		this.rvprice = rvprice;
		this.rvquality = rvquality;
		this.rvprofessional = rvprofessional;
		this.rvresponsible = rvresponsible;
		this.rvperiod = rvperiod;
		this.rvregion = rvregion;
		this.rvbuildingtype = rvbuildingtype;
		this.rvarea = rvarea;
		this.rvspacious = rvspacious;
		this.rvprice2 = rvprice2;
		this.rvcritique = rvcritique;
		this.rvdate = rvdate;
		this.consid = consid;
		this.userid = userid;
	}

	public int getRvnum() {
		return rvnum;
	}

	public void setRvnum(int rvnum) {
		this.rvnum = rvnum;
	}

	public int getRvkind() {
		return rvkind;
	}

	public void setRvkind(int rvkind) {
		this.rvkind = rvkind;
	}

	public int getRvprice() {
		return rvprice;
	}

	public void setRvprice(int rvprice) {
		this.rvprice = rvprice;
	}

	public int getRvquality() {
		return rvquality;
	}

	public void setRvquality(int rvquality) {
		this.rvquality = rvquality;
	}

	public int getRvprofessional() {
		return rvprofessional;
	}

	public void setRvprofessional(int rvprofessional) {
		this.rvprofessional = rvprofessional;
	}

	public int getRvresponsible() {
		return rvresponsible;
	}

	public void setRvresponsible(int rvresponsible) {
		this.rvresponsible = rvresponsible;
	}

	public String getRvperiod() {
		return rvperiod;
	}

	public void setRvperiod(String rvperiod) {
		this.rvperiod = rvperiod;
	}

	public String getRvregion() {
		return rvregion;
	}

	public void setRvregion(String rvregion) {
		this.rvregion = rvregion;
	}

	public String getRvbuildingtype() {
		return rvbuildingtype;
	}

	public void setRvbuildingtype(String rvbuildingtype) {
		this.rvbuildingtype = rvbuildingtype;
	}

	public String getRvarea() {
		return rvarea;
	}

	public void setRvarea(String rvarea) {
		this.rvarea = rvarea;
	}

	public String getRvspacious() {
		return rvspacious;
	}

	public void setRvspacious(String rvspacious) {
		this.rvspacious = rvspacious;
	}

	public String getRvprice2() {
		return rvprice2;
	}

	public void setRvprice2(String rvprice2) {
		this.rvprice2 = rvprice2;
	}

	public String getRvcritique() {
		return rvcritique;
	}

	public void setRvcritique(String rvcritique) {
		this.rvcritique = rvcritique;
	}

	public java.sql.Date getRvdate() {
		return rvdate;
	}

	public void setRvdate(java.sql.Date rvdate) {
		this.rvdate = rvdate;
	}

	public String getConsid() {
		return consid;
	}

	public void setConsid(String consid) {
		this.consid = consid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Review [rvnum=" + rvnum + ", rvkind=" + rvkind + ", rvprice=" + rvprice + ", rvquality=" + rvquality
				+ ", rvprofessional=" + rvprofessional + ", rvresponsible=" + rvresponsible + ", rvperiod=" + rvperiod
				+ ", rvregion=" + rvregion + ", rvbuildingtype=" + rvbuildingtype + ", rvarea=" + rvarea
				+ ", rvspacious=" + rvspacious + ", rvprice2=" + rvprice2 + ", rvcritique=" + rvcritique + ", rvdate="
				+ rvdate + ", consid=" + consid + ", userid=" + userid + "]";
	}
	
	
}
