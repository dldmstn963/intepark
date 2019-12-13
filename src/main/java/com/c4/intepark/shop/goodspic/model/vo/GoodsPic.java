package com.c4.intepark.shop.goodspic.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GoodsPic implements Serializable{
	private static final long serialVersionUID = 4010L;

	private int picnum;
	private int goodsnum;
	private String orifile;
	private String refile;
	public GoodsPic() {
		super();
	}
	public GoodsPic(int picnum, int goodsnum, String orifile, String refile) {
		super();
		this.picnum = picnum;
		this.goodsnum = goodsnum;
		this.orifile = orifile;
		this.refile = refile;
	}
	public int getPicnum() {
		return picnum;
	}
	public void setPicnum(int picnum) {
		this.picnum = picnum;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	public String getOrifile() {
		return orifile;
	}
	public void setOrifile(String orifile) {
		this.orifile = orifile;
	}
	public String getRefile() {
		return refile;
	}
	public void setRefile(String refile) {
		this.refile = refile;
	}
	@Override
	public String toString() {
		return "GoodsPic [picnum=" + picnum + ", goodsnum=" + goodsnum + ", orifile=" + orifile + ", refile=" + refile
				+ "]";
	}
}
