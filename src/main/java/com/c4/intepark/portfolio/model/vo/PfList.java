package com.c4.intepark.portfolio.model.vo;

import org.springframework.stereotype.Component;

@Component
public class PfList implements java.io.Serializable {
	private static final long serialVersionUID = 5101L;
	
	private String companyname;
	private String consarea;
	private String profilerenameimg;
	private String consintroduction;
	private int pfphotonum;
	
	public PfList() {}

	public PfList(String companyname, String consarea, String profilerenameimg, String consintroduction,
			int pfphotonum) {
		super();
		this.companyname = companyname;
		this.consarea = consarea;
		this.profilerenameimg = profilerenameimg;
		this.consintroduction = consintroduction;
		this.pfphotonum = pfphotonum;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getConsarea() {
		return consarea;
	}

	public void setConsarea(String consarea) {
		this.consarea = consarea;
	}

	public String getProfilerenameimg() {
		return profilerenameimg;
	}

	public void setProfilerenameimg(String profilerenameimg) {
		this.profilerenameimg = profilerenameimg;
	}

	public String getConsintroduction() {
		return consintroduction;
	}

	public void setConsintroduction(String consintroduction) {
		this.consintroduction = consintroduction;
	}

	public int getPfphotonum() {
		return pfphotonum;
	}

	public void setPfphotonum(int pfphotonum) {
		this.pfphotonum = pfphotonum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PfList [companyname=" + companyname + ", consarea=" + consarea + ", profilerenameimg="
				+ profilerenameimg + ", consintroduction=" + consintroduction + ", pfphotonum=" + pfphotonum + "]";
	}

	
}
