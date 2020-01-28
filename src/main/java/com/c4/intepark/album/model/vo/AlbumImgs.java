package com.c4.intepark.album.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AlbumImgs implements java.io.Serializable{
	private static final long serialVersionUID = 6449L;
	 
	private int albumimgnum;
	private String albumoriginalimgname;
	private String albumrenameimgname;
	private String albumimgroot;
	private int albumnum;
	
	public AlbumImgs() {}

	public AlbumImgs(int albumimgnum, String albumoriginalimgname, String albumrenameimgname, String albumimgroot,
			int albumnum) {
		super();
		this.albumimgnum = albumimgnum;
		this.albumoriginalimgname = albumoriginalimgname;
		this.albumrenameimgname = albumrenameimgname;
		this.albumimgroot = albumimgroot;
		this.albumnum = albumnum;
	}

	public int getAlbumimgnum() {
		return albumimgnum;
	}

	public void setAlbumimgnum(int albumimgnum) {
		this.albumimgnum = albumimgnum;
	}

	public String getAlbumoriginalimgname() {
		return albumoriginalimgname;
	}

	public void setAlbumoriginalimgname(String albumoriginalimgname) {
		this.albumoriginalimgname = albumoriginalimgname;
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

	public int getAlbumnum() {
		return albumnum;
	}

	public void setAlbumnum(int albumnum) {
		this.albumnum = albumnum;
	}

	@Override
	public String toString() {
		return "AlbumImgs [albumimgnum=" + albumimgnum + ", albumoriginalimgname=" + albumoriginalimgname
				+ ", albumrenameimgname=" + albumrenameimgname + ", albumimgroot=" + albumimgroot + ", albumnum="
				+ albumnum + "]";
	}

}
