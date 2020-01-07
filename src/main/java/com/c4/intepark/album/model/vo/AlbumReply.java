package com.c4.intepark.album.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class AlbumReply implements java.io.Serializable{
	private static final long serialVersionUID = 6446L;
	
	private int albumreplyoriginalno;
	private int albumreplygroupno;
	private int albumreplygrouporder;
	private int albumreplygrouplayer;
	private String albumreplydate;
	private String albumreplycontents;
	private String albumreplydelete;
	private int albumnum;
	private String userid;
	
	public AlbumReply() {}

	public AlbumReply(int albumreplyoriginalno, int albumreplygroupno, int albumreplygrouporder,
			int albumreplygrouplayer, String albumreplydate, String albumreplycontents, String albumreplydelete,
			int albumnum, String userid) {
		super();
		this.albumreplyoriginalno = albumreplyoriginalno;
		this.albumreplygroupno = albumreplygroupno;
		this.albumreplygrouporder = albumreplygrouporder;
		this.albumreplygrouplayer = albumreplygrouplayer;
		this.albumreplydate = albumreplydate;
		this.albumreplycontents = albumreplycontents;
		this.albumreplydelete = albumreplydelete;
		this.albumnum = albumnum;
		this.userid = userid;
	}

	public int getAlbumreplyoriginalno() {
		return albumreplyoriginalno;
	}

	public void setAlbumreplyoriginalno(int albumreplyoriginalno) {
		this.albumreplyoriginalno = albumreplyoriginalno;
	}

	public int getAlbumreplygroupno() {
		return albumreplygroupno;
	}

	public void setAlbumreplygroupno(int albumreplygroupno) {
		this.albumreplygroupno = albumreplygroupno;
	}

	public int getAlbumreplygrouporder() {
		return albumreplygrouporder;
	}

	public void setAlbumreplygrouporder(int albumreplygrouporder) {
		this.albumreplygrouporder = albumreplygrouporder;
	}

	public int getAlbumreplygrouplayer() {
		return albumreplygrouplayer;
	}

	public void setAlbumreplygrouplayer(int albumreplygrouplayer) {
		this.albumreplygrouplayer = albumreplygrouplayer;
	}

	public String getAlbumreplydate() {
		return albumreplydate;
	}

	public void setAlbumreplydate(String albumreplydate) {
		this.albumreplydate = albumreplydate;
	}

	public String getAlbumreplycontents() {
		return albumreplycontents;
	}

	public void setAlbumreplycontents(String albumreplycontents) {
		this.albumreplycontents = albumreplycontents;
	}

	public String getAlbumreplydelete() {
		return albumreplydelete;
	}

	public void setAlbumreplydelete(String albumreplydelete) {
		this.albumreplydelete = albumreplydelete;
	}

	public int getAlbumnum() {
		return albumnum;
	}

	public void setAlbumnum(int albumnum) {
		this.albumnum = albumnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "AlbumReply [albumreplyoriginalno=" + albumreplyoriginalno + ", albumreplygroupno=" + albumreplygroupno
				+ ", albumreplygrouporder=" + albumreplygrouporder + ", albumreplygrouplayer=" + albumreplygrouplayer
				+ ", albumreplydate=" + albumreplydate + ", albumreplycontents=" + albumreplycontents
				+ ", albumreplydelete=" + albumreplydelete + ", albumnum=" + albumnum + ", userid=" + userid + "]";
	}

	

}
