package com.c4.intepark.calendar.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Chatmessage implements java.io.Serializable{
	private static final long serialVersionUID = 3003L;
		
	private String chatcontent;
	private java.sql.Date chattime;
	private int chatno;
	private String consid;
	private String userid;

	public Chatmessage() {}

	public Chatmessage(String chatcontent, Date chattime, int chatno, String consid, String userid) {
		super();
		this.chatcontent = chatcontent;
		this.chattime = chattime;
		this.chatno = chatno;
		this.consid = consid;
		this.userid = userid;
	}

	public String getChatcontent() {
		return chatcontent;
	}

	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}

	public java.sql.Date getChattime() {
		return chattime;
	}

	public void setChattime(java.sql.Date chattime) {
		this.chattime = chattime;
	}

	public int getChatno() {
		return chatno;
	}

	public void setChatno(int chatno) {
		this.chatno = chatno;
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

	@Override
	public String toString() {
		return "Chatmessage [chatcontent=" + chatcontent + ", chattime=" + chattime + ", chatno=" + chatno + ", consid="
				+ consid + ", userid=" + userid + "]";
	}
	
	
}
