package com.c4.intepark.shop.goods.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class GoodsSearch implements Serializable{
	private static final long serialVersionUID = 4008L;
	
	private int startRow;
	private int endRow;
	private String consid;
	private String goodsname;
	private int goodsnum;
	public GoodsSearch() {
		super();
	}
	public String getConsid() {
		return consid;
	}
	public void setConsid(String consid) {
		this.consid = consid;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	
	
	
	
	
	
	
	
}
