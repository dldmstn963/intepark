package com.c4.intepark.shop.goods.model.vo;

public class GoodsList implements java.io.Serializable{
	private static final long serialVersionUID = 4011;
	
	private int startRow;
	private int endRow;
	private String consid;
	public GoodsList() {
		super();
	}
	public GoodsList(int startRow, int endRow, String consid) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.consid = consid;
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
	public String getConsid() {
		return consid;
	}
	public void setConsid(String consid) {
		this.consid = consid;
	}
	@Override
	public String toString() {
		return "GoodsList [startRow=" + startRow + ", endRow=" + endRow + ", consid=" + consid + "]";
	}

}
