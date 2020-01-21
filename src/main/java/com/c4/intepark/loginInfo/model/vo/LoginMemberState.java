package com.c4.intepark.loginInfo.model.vo;

import java.sql.Date;

public class LoginMemberState implements java.io.Serializable{
	private static final long serialVersionUID = 6057L;
	
	private String logid;
	private String memberstate;
	private java.sql.Date withdrawdate;
	private String withdrawcause;
	private int stopno;
	private String stoptarget;
	private String stopcause;
	private java.sql.Date stopstartdate;
	private java.sql.Date stopfinishdate;
	private String stopremove;
	private String stopterm;
	private String sdate;
	private String dmy;
	
	public LoginMemberState() {}

	public LoginMemberState(String logid, String memberstate, Date withdrawdate, String withdrawcause, int stopno,
			String stoptarget, String stopcause, Date stopstartdate, Date stopfinishdate, String stopremove,
			String stopterm, String sdate, String dmy) {
		super();
		this.logid = logid;
		this.memberstate = memberstate;
		this.withdrawdate = withdrawdate;
		this.withdrawcause = withdrawcause;
		this.stopno = stopno;
		this.stoptarget = stoptarget;
		this.stopcause = stopcause;
		this.stopstartdate = stopstartdate;
		this.stopfinishdate = stopfinishdate;
		this.stopremove = stopremove;
		this.stopterm = stopterm;
		this.sdate = sdate;
		this.dmy = dmy;
	}

	public String getLogid() {
		return logid;
	}

	public void setLogid(String logid) {
		this.logid = logid;
	}

	public String getMemberstate() {
		return memberstate;
	}

	public void setMemberstate(String memberstate) {
		this.memberstate = memberstate;
	}

	public java.sql.Date getWithdrawdate() {
		return withdrawdate;
	}

	public void setWithdrawdate(java.sql.Date withdrawdate) {
		this.withdrawdate = withdrawdate;
	}

	public String getWithdrawcause() {
		return withdrawcause;
	}

	public void setWithdrawcause(String withdrawcause) {
		this.withdrawcause = withdrawcause;
	}

	public int getStopno() {
		return stopno;
	}

	public void setStopno(int stopno) {
		this.stopno = stopno;
	}

	public String getStoptarget() {
		return stoptarget;
	}

	public void setStoptarget(String stoptarget) {
		this.stoptarget = stoptarget;
	}

	public String getStopcause() {
		return stopcause;
	}

	public void setStopcause(String stopcause) {
		this.stopcause = stopcause;
	}

	public java.sql.Date getStopstartdate() {
		return stopstartdate;
	}

	public void setStopstartdate(java.sql.Date stopstartdate) {
		this.stopstartdate = stopstartdate;
	}

	public java.sql.Date getStopfinishdate() {
		return stopfinishdate;
	}

	public void setStopfinishdate(java.sql.Date stopfinishdate) {
		this.stopfinishdate = stopfinishdate;
	}

	public String getStopremove() {
		return stopremove;
	}

	public void setStopremove(String stopremove) {
		this.stopremove = stopremove;
	}

	public String getStopterm() {
		return stopterm;
	}

	public void setStopterm(String stopterm) {
		this.stopterm = stopterm;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getDmy() {
		return dmy;
	}

	public void setDmy(String dmy) {
		this.dmy = dmy;
	}

	@Override
	public String toString() {
		return "LoginMemberState [logid=" + logid + ", memberstate=" + memberstate + ", withdrawdate=" + withdrawdate
				+ ", withdrawcause=" + withdrawcause + ", stopno=" + stopno + ", stoptarget=" + stoptarget
				+ ", stopcause=" + stopcause + ", stopstartdate=" + stopstartdate + ", stopfinishdate=" + stopfinishdate
				+ ", stopremove=" + stopremove + ", stopterm=" + stopterm + ", sdate=" + sdate + ", dmy=" + dmy + "]";
	}
	
	


	

}
