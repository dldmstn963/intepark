package com.c4.intepark.album.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Album implements java.io.Serializable{
	private static final long serialVersionUID = 6442L;
	
	private int albumnum;
	private String albumtitle;
	private String albumdate;
	private String albumcontents;
	private int albumreadcount;
	private String albumrenameimgname;
	private String albumimgroot;
	private String userid;
	
	public Album() {}

	public Album(int albumnum, String albumtitle, String albumdate, String albumcontents, int albumreadcount,
			String albumrenameimgname, String albumimgroot, String userid) {
		super();
		this.albumnum = albumnum;
		this.albumtitle = albumtitle;
		this.albumdate = albumdate;
		this.albumcontents = albumcontents;
		this.albumreadcount = albumreadcount;
		this.albumrenameimgname = albumrenameimgname;
		this.albumimgroot = albumimgroot;
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

	public String getAlbumdate() {
		return albumdate;
	}

	public void setAlbumdate(String albumdate) {
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

	public String getAlbumrenameimgname() {
		return albumrenameimgname;
	}

	public void setAlbumrenameimgname(String albumrenameimgname) {
		this.albumrenameimgname = albumrenameimgname;
	}

	public String getAlbumimgroot() {
		return albumimgroot;
	}

	public void setAlbumimgroot(String albumimgroot) {
		this.albumimgroot = albumimgroot;
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
				+ ", albumcontents=" + albumcontents + ", albumreadcount=" + albumreadcount + ", albumrenameimgname="
				+ albumrenameimgname + ", albumimgroot=" + albumimgroot + ", userid=" + userid + "]";
	}
	
}
