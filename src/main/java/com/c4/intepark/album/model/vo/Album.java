package com.c4.intepark.album.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Album implements java.io.Serializable{
	private static final long serialVersionUID = 6442L;
	
	private int albumnum;
	private String albumtitle;
	private java.sql.Date albumdate;
	private String albumcontents;
	private int albumreadcount;
	private String userid;
	
	public Album() {}

	public Album(int albumnum, String albumtitle, Date albumdate, String albumcontents, int albumreadcount,
			String userid) {
		super();
		this.albumnum = albumnum;
		this.albumtitle = albumtitle;
		this.albumdate = albumdate;
		this.albumcontents = albumcontents;
		this.albumreadcount = albumreadcount;
		this.userid = userid;
	}

	public int getAlbumnum() {
		return albumnum;
	}

	public void setAlbumnum(int albumnum) {
		this.albumnum = albumnum;
	}

	public String getAlbumtitle() {
		return albumtitle;
	}

	public void setAlbumtitle(String albumtitle) {
		this.albumtitle = albumtitle;
	}

	public java.sql.Date getAlbumdate() {
		return albumdate;
	}

	public void setAlbumdate(java.sql.Date albumdate) {
		this.albumdate = albumdate;
	}

	public String getAlbumcontents() {
		return albumcontents;
	}

	public void setAlbumcontents(String albumcontents) {
		this.albumcontents = albumcontents;
	}

	public int getAlbumreadcount() {
		return albumreadcount;
	}

	public void setAlbumreadcount(int albumreadcount) {
		this.albumreadcount = albumreadcount;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Album [albumnum=" + albumnum + ", albumtitle=" + albumtitle + ", albumdate=" + albumdate
				+ ", albumcontents=" + albumcontents + ", albumreadcount=" + albumreadcount + ", userid=" + userid
				+ "]";
	}
	
	
}
