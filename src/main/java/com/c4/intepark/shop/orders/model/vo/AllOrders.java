package com.c4.intepark.shop.orders.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AllOrders implements Serializable{

	private static final long serialVersionUID = 4012L;
	
	private int dlvynum; 
	private String addressee; 
	private String address; 
	private int phone; 
	private String dlvyname; 
	private String userid;
	private int requestnum;
	private String requestcn; 
	private int ordernum;
	private Date orderdate; 
	private int orderprice; 
	private String orderstatus; 
	private int orderquantity;
	private int goodsnum;
	private int goodsprice;
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
	public AllOrders() {
		super();
	}
	public AllOrders(int dlvynum, String addressee, String address, int phone, String dlvyname, String userid,
			int requestnum, String requestcn, int ordernum, Date orderdate, int orderprice, String orderstatus,
			int orderquantity, int goodsnum, int goodsprice, int categorynum, String goodsname, int price,
			int inventory, String freedlvy, String thumbnail, String comments, String description, int maximum,
			String consid, Date goodsdate) {
		super();
		this.dlvynum = dlvynum;
		this.addressee = addressee;
		this.address = address;
		this.phone = phone;
		this.dlvyname = dlvyname;
		this.userid = userid;
		this.requestnum = requestnum;
		this.requestcn = requestcn;
		this.ordernum = ordernum;
		this.orderdate = orderdate;
		this.orderprice = orderprice;
		this.orderstatus = orderstatus;
		this.orderquantity = orderquantity;
		this.goodsnum = goodsnum;
		this.goodsprice = goodsprice;
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
	public int getDlvynum() {
		return dlvynum;
	}
	public void setDlvynum(int dlvynum) {
		this.dlvynum = dlvynum;
	}
	public String getAddressee() {
		return addressee;
	}
	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getDlvyname() {
		return dlvyname;
	}
	public void setDlvyname(String dlvyname) {
		this.dlvyname = dlvyname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getRequestnum() {
		return requestnum;
	}
	public void setRequestnum(int requestnum) {
		this.requestnum = requestnum;
	}
	public String getRequestcn() {
		return requestcn;
	}
	public void setRequestcn(String requestcn) {
		this.requestcn = requestcn;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public int getOrderquantity() {
		return orderquantity;
	}
	public void setOrderquantity(int orderquantity) {
		this.orderquantity = orderquantity;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	public int getGoodsprice() {
		return goodsprice;
	}
	public void setGoodsprice(int goodsprice) {
		this.goodsprice = goodsprice;
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
		return "AllOrders [dlvynum=" + dlvynum + ", addressee=" + addressee + ", address=" + address + ", phone="
				+ phone + ", dlvyname=" + dlvyname + ", userid=" + userid + ", requestnum=" + requestnum
				+ ", requestcn=" + requestcn + ", ordernum=" + ordernum + ", orderdate=" + orderdate + ", orderprice="
				+ orderprice + ", orderstatus=" + orderstatus + ", orderquantity=" + orderquantity + ", goodsnum="
				+ goodsnum + ", goodsprice=" + goodsprice + ", categorynum=" + categorynum + ", goodsname=" + goodsname
				+ ", price=" + price + ", inventory=" + inventory + ", freedlvy=" + freedlvy + ", thumbnail="
				+ thumbnail + ", comments=" + comments + ", description=" + description + ", maximum=" + maximum
				+ ", consid=" + consid + ", goodsdate=" + goodsdate + "]";
	}	
	
	
}
