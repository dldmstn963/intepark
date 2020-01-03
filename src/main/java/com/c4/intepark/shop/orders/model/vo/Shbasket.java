package com.c4.intepark.shop.orders.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

/**
 * @author Administrator
 *
 */
@Component
public class Shbasket implements Serializable{
	private static final long serialVersionUID = 4009L;
	
	private int shbasketnum;
	private int quantity;
	private int goodsnum;
	private String userid;
	
	
	public Shbasket() {
		super();
	}
	
	public Shbasket(int shbasketnum, int quantity, int goodsnum, String userid) {
		super();
		this.shbasketnum = shbasketnum;
		this.quantity = quantity;
		this.goodsnum = goodsnum;
		this.userid = userid;
	}

	public int getShbasketnum() {
		return shbasketnum;
	}
	public void setShbasketnum(int shbasketnum) {
		this.shbasketnum = shbasketnum;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
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
		return "Shbasket [shbasketnum=" + shbasketnum + ", quantity=" + quantity + ", goodsnum=" + goodsnum
				+ ", userid=" + userid + "]";
	}
	
	
	
	
	
}

