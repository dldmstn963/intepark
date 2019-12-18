package com.c4.intepark.chat.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Chat implements java.io.Serializable{
	private static final long seriaVersionUID = 3002L;
	
	private int chatno;
	private String consid;
	private String userid;
	
	public Chat() {}
	
	public Chat(int chatno, String consid, String userid) {
		super();
		this.chatno = chatno;
		this.consid = consid;
		this.userid = userid;
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
		return "Chat [chatno=" + chatno + ", consid=" + consid + ", userid=" + userid + "]";
	}
	
	

}
