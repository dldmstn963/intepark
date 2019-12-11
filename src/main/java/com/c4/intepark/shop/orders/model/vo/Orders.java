package com.c4.intepark.shop.orders.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Orders implements Serializable{
	private static final long serialVersionUID = 4002L;
	
	private int ordernum;
	private Date orderdate; 
	private int orderprice; 
	private String orderstatus; 
	private String userid; 
	private int dlvynum; 
	private int requestnum;
	public Orders() {
		super();
	}
	public Orders(int ordernum, Date orderdate, int orderprice, String orderstatus, String userid, int dlvynum,
			int requestnum) {
		super();
		this.ordernum = ordernum;
		this.orderdate = orderdate;
		this.orderprice = orderprice;
		this.orderstatus = orderstatus;
		this.userid = userid;
		this.dlvynum = dlvynum;
		this.requestnum = requestnum;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getDlvynum() {
		return dlvynum;
	}
	public void setDlvynum(int dlvynum) {
		this.dlvynum = dlvynum;
	}
	public int getRequestnum() {
		return requestnum;
	}
	public void setRequestnum(int requestnum) {
		this.requestnum = requestnum;
	}
	@Override
	public String toString() {
		return "Orders [ordernum=" + ordernum + ", orderdate=" + orderdate + ", orderprice=" + orderprice
				+ ", orderstatus=" + orderstatus + ", userid=" + userid + ", dlvynum=" + dlvynum + ", requestnum="
				+ requestnum + "]";
	}
	
}
