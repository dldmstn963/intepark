package com.c4.intepark.portfolio.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Portfolio implements java.io.Serializable {
	private static final long serialVersionUID = 5100L;
	
	private int pfnum;
	private String pftitle;
	private String consid;
	
	public Portfolio() {}

	public Portfolio(int pfnum, String pftitle, String consid) {
		super();
		this.pfnum = pfnum;
		this.pftitle = pftitle;
		this.consid = consid;
	}

	public int getPfnum() {
		return pfnum;
	}

	public void setPfnum(int pfnum) {
		this.pfnum = pfnum;
	}

	public String getPftitle() {
		return pftitle;
	}

	public void setPftitle(String pftitle) {
		this.pftitle = pftitle;
	}

	public String getConsid() {
		return consid;
	}

	public void setConsid(String consid) {
		this.consid = consid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Portfolio [pfnum=" + pfnum + ", pftitle=" + pftitle + ", consid=" + consid + "]";
	}
	
	
}
