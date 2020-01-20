package com.c4.intepark.inteuser.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class InteUser implements java.io.Serializable{
	private static final long serialVersionUID = 6002L;
	
	private String userid;
	private String userpwd;
	private java.sql.Date enrolldate;
	private String username;
	private String phone;
	private String useremail;
	private String address;
	private String memberstate;
	private java.sql.Date withdrawdate;
	private String withdrawcause;
	
	public InteUser() {}

	public InteUser(String userid, String userpwd, Date enrolldate, String username, String phone, String useremail,
			String address, String memberstate, Date withdrawdate, String withdrawcause) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.enrolldate = enrolldate;
		this.username = username;
		this.phone = phone;
		this.useremail = useremail;
		this.address = address;
		this.memberstate = memberstate;
		this.withdrawdate = withdrawdate;
		this.withdrawcause = withdrawcause;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public java.sql.Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(java.sql.Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
		return "InteUser [userid=" + userid + ", userpwd=" + userpwd + ", enrolldate=" + enrolldate + ", username="
				+ username + ", phone=" + phone + ", useremail=" + useremail + ", address=" + address + ", memberstate="
				+ memberstate + ", withdrawdate=" + withdrawdate + ", withdrawcause=" + withdrawcause + "]";
	}
	
	



	
}