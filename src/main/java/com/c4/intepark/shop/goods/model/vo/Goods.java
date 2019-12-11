package com.c4.intepark.shop.goods.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Goods implements Serializable{
	private static final long serialVersionUID = 4001L;

	private int goodsnum;
	private int categorynum;
	private String goodsname;
	private int price;
	private int inventory;
	private String freedlvy;
	private String thumbnail;
	private String comments;
	private String description;
	private int maximum;
	private String consid;
	private Date goodsdate;
	public Goods() {
		super();
	}
	public Goods(int goodsnum, int categorynum, String goodsname, int price, int inventory, String freedlvy,
			String thumbnail, String comments, String description, int maximum, String consid, Date goodsdate) {
		super();
		this.goodsnum = goodsnum;
		this.categorynum = categorynum;
		this.goodsname = goodsname;
		this.price = price;
		this.inventory = inventory;
		this.freedlvy = freedlvy;
		this.thumbnail = thumbnail;
		this.comments = comments;
		this.description = description;
		this.maximum = maximum;
		this.consid = consid;
		this.goodsdate = goodsdate;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	public int getCategorynum() {
		return categorynum;
	}
	public void setCategorynum(int categorynum) {
		this.categorynum = categorynum;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public String getFreedlvy() {
		return freedlvy;
	}
	public void setFreedlvy(String freedlvy) {
		this.freedlvy = freedlvy;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getMaximum() {
		return maximum;
	}
	public void setMaximum(int maximum) {
		this.maximum = maximum;
	}
	public String getConsid() {
		return consid;
	}
	public void setConsid(String consid) {
		this.consid = consid;
	}
	public Date getGoodsdate() {
		return goodsdate;
	}
	public void setGoodsdate(Date goodsdate) {
		this.goodsdate = goodsdate;
	}
	@Override
	public String toString() {
		return "Goods [goodsnum=" + goodsnum + ", categorynum=" + categorynum + ", goodsname=" + goodsname + ", price="
				+ price + ", inventory=" + inventory + ", freedlvy=" + freedlvy + ", thumbnail=" + thumbnail
				+ ", comments=" + comments + ", description=" + description + ", maximum=" + maximum + ", consid="
				+ consid + ", goodsdate=" + goodsdate + "]";
	}
}
