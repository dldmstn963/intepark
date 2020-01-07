package com.c4.intepark.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Constructor implements java.io.Serializable{
	private static final long serialVersionUID = 6022L;
	
	private String consid;
	private String conspwd;
	private java.sql.Date enrolldate;
	private String consname;
	private String phone;
	private String email;
	private String address;
	private String companyname;
	private String consarea;
	private String asdate;
	private String career;
	private String consintroduction;
	private String pfintroduction;
	private String profileoriginalimg;
	private String profilerenameimg;
	private String blicenceoriginalimg;
	private String blicencerenameimg;
	private String memberstate;
	private java.sql.Date withdrawdate;
	private String withdrawcause;
	
	public Constructor() {}

	public Constructor(String consid, String conspwd, Date enrolldate, String consname, String phone, String email,
			String address, String companyname, String consarea, String asdate, String career, String consintroduction,
			String pfintroduction, String profileoriginalimg, String profilerenameimg, String blicenceoriginalimg,
			String blicencerenameimg, String memberstate, Date withdrawdate, String withdrawcause) {
		super();
		this.consid = consid;
		this.conspwd = conspwd;
		this.enrolldate = enrolldate;
		this.consname = consname;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.companyname = companyname;
		this.consarea = consarea;
		this.asdate = asdate;
		this.career = career;
		this.consintroduction = consintroduction;
		this.pfintroduction = pfintroduction;
		this.profileoriginalimg = profileoriginalimg;
		this.profilerenameimg = profilerenameimg;
		this.blicenceoriginalimg = blicenceoriginalimg;
		this.blicencerenameimg = blicencerenameimg;
		this.memberstate = memberstate;
		this.withdrawdate = withdrawdate;
		this.withdrawcause = withdrawcause;
	}
	
	

	public String getConsid() {
		return consid;
	}

	public void setConsid(String consid) {
		this.consid = consid;
	}

	public String getConspwd() {
		return conspwd;
	}

	public void setConspwd(String conspwd) {
		this.conspwd = conspwd;
	}

	public java.sql.Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(java.sql.Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getConsname() {
		return consname;
	}

	public void setConsname(String consname) {
		this.consname = consname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getConsarea() {
		return consarea;
	}

	public void setConsarea(String consarea) {
		this.consarea = consarea;
	}

	public String getAsdate() {
		return asdate;
	}

	public void setAsdate(String asdate) {
		this.asdate = asdate;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getConsintroduction() {
		return consintroduction;
	}

	public void setConsintroduction(String consintroduction) {
		this.consintroduction = consintroduction;
	}

	public String getPfintroduction() {
		return pfintroduction;
	}

	public void setPfintroduction(String pfintroduction) {
		this.pfintroduction = pfintroduction;
	}

	public String getProfileoriginalimg() {
		return profileoriginalimg;
	}

	public void setProfileoriginalimg(String profileoriginalimg) {
		this.profileoriginalimg = profileoriginalimg;
	}

	public String getProfilerenameimg() {
		return profilerenameimg;
	}

	public void setProfilerenameimg(String profilerenameimg) {
		this.profilerenameimg = profilerenameimg;
	}

	public String getBlicenceoriginalimg() {
		return blicenceoriginalimg;
	}

	public void setBlicenceoriginalimg(String blicenceoriginalimg) {
		this.blicenceoriginalimg = blicenceoriginalimg;
	}

	public String getBlicencerenameimg() {
		return blicencerenameimg;
	}

	public void setBlicencerenameimg(String blicencerenameimg) {
		this.blicencerenameimg = blicencerenameimg;
	}

	public String getMemberstate() {
		return memberstate;
	}

	public void setMemberstate(String memberstate) {
		this.memberstate = memberstate;
	}

	public java.sql.Date getWithdrawdate() {
		return withdrawdate;
	}

	public void setWithdrawdate(java.sql.Date withdrawdate) {
		this.withdrawdate = withdrawdate;
	}

	public String getWithdrawcause() {
		return withdrawcause;
	}

	public void setWithdrawcause(String withdrawcause) {
		this.withdrawcause = withdrawcause;
	}

	@Override
	public String toString() {
		return "Constructor [consid=" + consid + ", conspwd=" + conspwd + ", enrolldate=" + enrolldate + ", consname="
				+ consname + ", phone=" + phone + ", email=" + email + ", address=" + address + ", companyname="
				+ companyname + ", consarea=" + consarea + ", asdate=" + asdate + ", career=" + career
				+ ", consintroduction=" + consintroduction + ", pfintroduction=" + pfintroduction
				+ ", profileoriginalimg=" + profileoriginalimg + ", profilerenameimg=" + profilerenameimg
				+ ", blicenceoriginalimg=" + blicenceoriginalimg + ", blicencerenameimg=" + blicencerenameimg
				+ ", memberstate=" + memberstate + ", withdrawdate=" + withdrawdate + ", withdrawcause=" + withdrawcause
				+ "]";
	}
	
	

}
