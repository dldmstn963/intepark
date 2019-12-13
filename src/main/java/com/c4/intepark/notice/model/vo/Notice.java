package com.c4.intepark.notice.model.vo;

import java.sql.Date;
import java.io.Serializable;

public class Notice  implements java.io.Serializable {
	private static final long serialVersionUID = 1333L;
	
	private int noticeno;
	private String noticetitle;
	private String noticecontent;
	private int noticecount;
	private java.sql.Date noticedate;
	private String noticewriter;
	private String noticeoriginalfilename;
	private String noticerenamefilename;
	private String writername;
	
	public Notice() {}

	public Notice(int noticeno, String noticetitle, String noticecontent, int noticecount, Date noticedate,
			String noticewriter, String noticeoriginalfilename, String noticerenamefilename, String writername) {
		super();
		this.noticeno = noticeno;
		this.noticetitle = noticetitle;
		this.noticecontent = noticecontent;
		this.noticecount = noticecount;
		this.noticedate = noticedate;
		this.noticewriter = noticewriter;
		this.noticeoriginalfilename = noticeoriginalfilename;
		this.noticerenamefilename = noticerenamefilename;
		this.writername = writername;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public String getNoticecontent() {
		return noticecontent;
	}

	public int getNoticecount() {
		return noticecount;
	}

	public java.sql.Date getNoticedate() {
		return noticedate;
	}

	public String getNoticewriter() {
		return noticewriter;
	}

	public String getNoticeoriginalfilename() {
		return noticeoriginalfilename;
	}

	public String getNoticerenamefilename() {
		return noticerenamefilename;
	}

	public String getWritername() {
		return writername;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public void setNoticecount(int noticecount) {
		this.noticecount = noticecount;
	}

	public void setNoticedate(java.sql.Date noticedate) {
		this.noticedate = noticedate;
	}

	public void setNoticewriter(String noticewriter) {
		this.noticewriter = noticewriter;
	}

	public void setNoticeoriginalfilename(String noticeoriginalfilename) {
		this.noticeoriginalfilename = noticeoriginalfilename;
	}

	public void setNoticerenamefilename(String noticerenamefilename) {
		this.noticerenamefilename = noticerenamefilename;
	}

	public void setWritername(String writername) {
		this.writername = writername;
	}

	@Override
	public String toString() {
		return "Notice [noticeno=" + noticeno + ", noticetitle=" + noticetitle + ", noticecontent=" + noticecontent
				+ ", noticecount=" + noticecount + ", noticedate=" + noticedate + ", noticewriter=" + noticewriter
				+ ", noticeoriginalfilename=" + noticeoriginalfilename + ", noticerenamefilename="
				+ noticerenamefilename + ", writername=" + writername + "]";
	}
	
	
}
