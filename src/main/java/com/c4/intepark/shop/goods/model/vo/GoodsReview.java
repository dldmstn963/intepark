package com.c4.intepark.shop.goods.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

/**
 * @author Administrator
 *
 */
@Component
public class GoodsReview implements Serializable{
	private static final long serialVersionUID = 4006L;

	private int reviewnum; 
	private Date reviewdate; 
	private String reviewcn; 
	private int reviewscore; 
	private String userid; 
	private String reviewtitle; 
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
	private int picnum;
	private String refile;
	
	public int getPicnum() {
		return picnum;
	}
	public void setPicnum(int picnum) {
		this.picnum = picnum;
	}
	public String getRefile() {
		return refile;
	}
	public void setRefile(String refile) {
		this.refile = refile;
	}
	public GoodsReview() {
		super();
	}
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}
	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	public String getReviewcn() {
		return reviewcn;
	}
	public void setReviewcn(String reviewcn) {
		this.reviewcn = reviewcn;
	}
	public int getReviewscore() {
		return reviewscore;
	}
	public void setReviewscore(int reviewscore) {
		this.reviewscore = reviewscore;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReviewtitle() {
		return reviewtitle;
	}
	public void setReviewtitle(String reviewtitle) {
		this.reviewtitle = reviewtitle;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GoodsReview [reviewnum=" + reviewnum + ", reviewdate=" + reviewdate + ", reviewcn=" + reviewcn
				+ ", reviewscore=" + reviewscore + ", userid=" + userid + ", reviewtitle=" + reviewtitle + ", goodsnum="
				+ goodsnum + ", categorynum=" + categorynum + ", goodsname=" + goodsname + ", price=" + price
				+ ", inventory=" + inventory + ", freedlvy=" + freedlvy + ", thumbnail=" + thumbnail + ", comments="
				+ comments + ", description=" + description + ", maximum=" + maximum + ", consid=" + consid
				+ ", goodsdate=" + goodsdate + "]";
	}	
	
	
}
