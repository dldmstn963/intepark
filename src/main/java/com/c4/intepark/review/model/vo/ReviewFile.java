package com.c4.intepark.review.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ReviewFile implements java.io.Serializable {
	private static final long serialVersionUID = 5301L;
	
	private int rvphotonum;	//리뷰사진번호
	private String rvoriginalname;	//오리지날 파일명
	private String rvrename;	//리네임 파일명
	private int rvnum;	//리뷰번호
	
	public ReviewFile() {}

	public ReviewFile(int rvphotonum, String rvoriginalname, String rvrename, int rvnum) {
		super();
		this.rvphotonum = rvphotonum;
		this.rvoriginalname = rvoriginalname;
		this.rvrename = rvrename;
		this.rvnum = rvnum;
	}

	public int getRvphotonum() {
		return rvphotonum;
	}

	public void setRvphotonum(int rvphotonum) {
		this.rvphotonum = rvphotonum;
	}

	public String getRvoriginalname() {
		return rvoriginalname;
	}

	public void setRvoriginalname(String rvoriginalname) {
		this.rvoriginalname = rvoriginalname;
	}

	public String getRvrename() {
		return rvrename;
	}

	public void setRvrename(String rvrename) {
		this.rvrename = rvrename;
	}

	public int getRvnum() {
		return rvnum;
	}

	public void setRvnum(int rvnum) {
		this.rvnum = rvnum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReviewFile [rvphotonum=" + rvphotonum + ", rvoriginalname=" + rvoriginalname + ", rvrename=" + rvrename
				+ ", rvnum=" + rvnum + "]";
	}
	
	
}
