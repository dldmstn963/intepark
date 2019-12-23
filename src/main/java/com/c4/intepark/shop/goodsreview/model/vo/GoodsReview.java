package com.c4.intepark.shop.goodsreview.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

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
	public GoodsReview() {
		super();
	}
	public GoodsReview(int reviewnum, Date reviewdate, String reviewcn, int reviewscore, String userid, int goodsnum) {
		super();
		this.reviewnum = reviewnum;
		this.reviewdate = reviewdate;
		this.reviewcn = reviewcn;
		this.reviewscore = reviewscore;
		this.userid = userid;
		this.goodsnum = goodsnum;
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
	public String getReviewtitle() {
		return reviewtitle;
	}
	public void setReviewtitle(String reviewtitle) {
		this.reviewtitle = reviewtitle;
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
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	@Override
	public String toString() {
		return "GoodsReview [reviewnum=" + reviewnum + ", reviewdate=" + reviewdate + ", reviewcn=" + reviewcn
				+ ", reviewscore=" + reviewscore + ", userid=" + userid + ", reviewtitle=" + reviewtitle + ", goodsnum="
				+ goodsnum + "]";
	}
	
	
}
