package com.c4.intepark.portfolio.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Request implements java.io.Serializable {
	private static final long serialVersionUID = 5101L;
	
	private int reqnum;	//상담신청 번호
	private String reqarea;	//시공분야
	private String reqregion;	//시공지역
	private String reqbudget;	//시공예산
	private String reqname;	//고객이름
	private int reqphone;	//고객전화번호
	private java.sql.Date reqdate;		//상담신청날짜
	private String consid;	//시공사 아이디
	private String userid;	//고객아이디
	
	public Request() {}

	public Request(int reqnum, String reqarea, String reqregion, String reqbudget, String reqname, int reqphone,
			Date reqdate, String consid, String userid) {
		super();
		this.reqnum = reqnum;
		this.reqarea = reqarea;
		this.reqregion = reqregion;
		this.reqbudget = reqbudget;
		this.reqname = reqname;
		this.reqphone = reqphone;
		this.reqdate = reqdate;
		this.consid = consid;
		this.userid = userid;
	}

	public int getReqnum() {
		return reqnum;
	}

	public void setReqnum(int reqnum) {
		this.reqnum = reqnum;
	}

	public String getReqarea() {
		return reqarea;
	}

	public void setReqarea(String reqarea) {
		this.reqarea = reqarea;
	}

	public String getReqregion() {
		return reqregion;
	}

	public void setReqregion(String reqregion) {
		this.reqregion = reqregion;
	}

	public String getReqbudget() {
		return reqbudget;
	}

	public void setReqbudget(String reqbudget) {
		this.reqbudget = reqbudget;
	}

	public String getReqname() {
		return reqname;
	}

	public void setReqname(String reqname) {
		this.reqname = reqname;
	}

	public int getReqphone() {
		return reqphone;
	}

	public void setReqphone(int reqphone) {
		this.reqphone = reqphone;
	}

	public java.sql.Date getReqdate() {
		return reqdate;
	}

	public void setReqdate(java.sql.Date reqdate) {
		this.reqdate = reqdate;
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
		return "Request [reqnum=" + reqnum + ", reqarea=" + reqarea + ", reqregion=" + reqregion + ", reqbudget="
				+ reqbudget + ", reqname=" + reqname + ", reqphone=" + reqphone + ", reqdate=" + reqdate + ", consid="
				+ consid + ", userid=" + userid + "]";
	}
	
	
}
