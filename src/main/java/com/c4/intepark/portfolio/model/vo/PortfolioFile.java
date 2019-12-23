package com.c4.intepark.portfolio.model.vo;

import org.springframework.stereotype.Component;

@Component
public class PortfolioFile implements java.io.Serializable {
	private static final long serialVersionUID = 5101L;
	
	private int pfphotonum;	//포트폴리오 사진번호
	private String pforiginalname;	//오리지날 파일명
	private String pfrename;	//리네임 파일명
	private String pfcoment;	//코멘트
	private int pfnum;	//포트폴리오 글번호
	
	public PortfolioFile() {}

	public PortfolioFile(int pfphotonum, String pforiginalname, String pfrename, String pfcoment, int pfnum) {
		super();
		this.pfphotonum = pfphotonum;
		this.pforiginalname = pforiginalname;
		this.pfrename = pfrename;
		this.pfcoment = pfcoment;
		this.pfnum = pfnum;
	}

	public int getPfphotonum() {
		return pfphotonum;
	}

	public void setPfphotonum(int pfphotonum) {
		this.pfphotonum = pfphotonum;
	}

	public String getPforiginalname() {
		return pforiginalname;
	}

	public void setPforiginalname(String pforiginalname) {
		this.pforiginalname = pforiginalname;
	}

	public String getPfrename() {
		return pfrename;
	}

	public void setPfrename(String pfrename) {
		this.pfrename = pfrename;
	}

	public String getPfcoment() {
		return pfcoment;
	}

	public void setPfcoment(String pfcoment) {
		this.pfcoment = pfcoment;
	}

	public int getPfnum() {
		return pfnum;
	}

	public void setPfnum(int pfnum) {
		this.pfnum = pfnum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PortfolioFile [pfphotonum=" + pfphotonum + ", pforiginalname=" + pforiginalname + ", pfrename="
				+ pfrename + ", pfcoment=" + pfcoment + ", pfnum=" + pfnum + "]";
	}
	
	
}
