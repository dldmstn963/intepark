package com.c4.intepark.faq.model.vo;

import java.sql.Date;
import java.io.Serializable;

public class Faq  implements java.io.Serializable {
	private static final long serialVersionUID = 1555L;
	
	private int faqno;
	private String faqtitle;
	private String faqcontent;
	private String faqwriter;
	private java.sql.Date faqdate;
	
	public Faq() {}

	public Faq(int faqno, String faqtitle, String faqcontent, String faqwriter, Date faqdate) {
		super();
		this.faqno = faqno;
		this.faqtitle = faqtitle;
		this.faqcontent = faqcontent;
		this.faqwriter = faqwriter;
		this.faqdate = faqdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getFaqno() {
		return faqno;
	}

	public String getFaqtitle() {
		return faqtitle;
	}

	public String getFaqcontent() {
		return faqcontent;
	}

	public String getFaqwriter() {
		return faqwriter;
	}

	public java.sql.Date getFaqdate() {
		return faqdate;
	}

	public void setFaqno(int faqno) {
		this.faqno = faqno;
	}

	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}

	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}

	public void setFaqwriter(String faqwriter) {
		this.faqwriter = faqwriter;
	}

	public void setFaqdate(java.sql.Date faqdate) {
		this.faqdate = faqdate;
	}

	@Override
	public String toString() {
		return "Faq [faqno=" + faqno + ", faqtitle=" + faqtitle + ", faqcontent=" + faqcontent + ", faqwriter="
				+ faqwriter + ", faqdate=" + faqdate + "]";
	}

	
	
	
}





