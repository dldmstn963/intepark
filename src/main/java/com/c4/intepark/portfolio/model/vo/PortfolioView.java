package com.c4.intepark.portfolio.model.vo;

import org.springframework.stereotype.Component;

@Component
public class PortfolioView implements java.io.Serializable {
	private static final long serialVersionUID = 5102L;
	
	private int pfnum;	//포트폴리오 글번호
	private String pftitle;	//포트폴리오 제목
	private String consid;	//시공사 아이디
	private String pfrename;	//리네임 사진이름
	
	public PortfolioView() {}

	public PortfolioView(int pfnum, String pftitle, String consid, String pfrename) {
		super();
		this.pfnum = pfnum;
		this.pftitle = pftitle;
		this.consid = consid;
		this.pfrename = pfrename;
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

	public String getPfrename() {
		return pfrename;
	}

	public void setPfrename(String pfrename) {
		this.pfrename = pfrename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PortfolioView [pfnum=" + pfnum + ", pftitle=" + pftitle + ", consid=" + consid + ", pfrename="
				+ pfrename + "]";
	}

	
}
