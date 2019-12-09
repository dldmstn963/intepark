package com.c4.intepark.calendar.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Calendar implements java.io.Serializable{
	private static final long serialVersionUID = 3001L;
	
	private int cno;
	private String ctitle;
	private String ccontent;
	private java.sql.Date cstart;
	private java.sql.Date cend;
	private String ccolor;
	private String consid;
	
	public Calendar() {}

	public Calendar(int cno, String ctitle, String ccontent, Date cstart, Date cend, String ccolor, String consid) {
		super();
		this.cno = cno;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.cstart = cstart;
		this.cend = cend;
		this.ccolor = ccolor;
		this.consid = consid;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public java.sql.Date getCstart() {
		return cstart;
	}

	public void setCstart(java.sql.Date cstart) {
		this.cstart = cstart;
	}

	public java.sql.Date getCend() {
		return cend;
	}

	public void setCend(java.sql.Date cend) {
		this.cend = cend;
	}

	public String getCcolor() {
		return ccolor;
	}

	public void setCcolor(String ccolor) {
		this.ccolor = ccolor;
	}

	public String getConsid() {
		return consid;
	}

	public void setConsid(String consid) {
		this.consid = consid;
	}

	@Override
	public String toString() {
		return "Calendar [cno=" + cno + ", ctitle=" + ctitle + ", ccontent=" + ccontent + ", cstart=" + cstart
				+ ", cend=" + cend + ", ccolor=" + ccolor + ", consid=" + consid + "]";
	}
	
		
}
