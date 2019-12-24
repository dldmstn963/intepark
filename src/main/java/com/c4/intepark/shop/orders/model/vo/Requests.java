package com.c4.intepark.shop.orders.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Requests implements Serializable{
	private static final long serialVersionUID = 4004L;
	
	private int requestnum;
	private String requestcn; 
	private String userid;
	public Requests() {
		super();
	}
	public Requests(int requestnum, String requestcn, String userid) {
		super();
		this.requestnum = requestnum;
		this.requestcn = requestcn;
		this.userid = userid;
	}
	
	public int getRequestnum() {
		return requestnum;
	}
	public void setRequestnum(int requestnum) {
		this.requestnum = requestnum;
	}
	public String getRequestcn() {
		return requestcn;
	}
	public void setRequestcn(String requestcn) {
		this.requestcn = requestcn;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "Requests [requestnum=" + requestnum + ", requestcn=" + requestcn + ", userid=" + userid + "]";
	}
}
