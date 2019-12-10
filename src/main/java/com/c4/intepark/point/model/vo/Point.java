package com.c4.intepark.point.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Point implements java.io.Serializable{
	private static final long serialVersionUID = 2002L;

private int pointno;
private String chargeamount;
private String chargepoint;
private String restpoint;
private String consid;

public Point () {}

public Point(int pointno, String chargeamount, String chargepoint, String restpoint, String consid) {
	super();
	this.pointno = pointno;
	this.chargeamount = chargeamount;
	this.chargepoint = chargepoint;
	this.restpoint = restpoint;
	this.consid = consid;
}

@Override
public String toString() {
	return "Point [pointno=" + pointno + ", chargeamount=" + chargeamount + ", chargepoint=" + chargepoint
			+ ", restpoint=" + restpoint + ", consid=" + consid + "]";
}

public int getPointno() {
	return pointno;
}

public void setPointno(int pointno) {
	this.pointno = pointno;
}

public String getChargeamount() {
	return chargeamount;
}

public void setChargeamount(String chargeamount) {
	this.chargeamount = chargeamount;
}

public String getChargepoint() {
	return chargepoint;
}

public void setChargepoint(String chargepoint) {
	this.chargepoint = chargepoint;
}

public String getRestpoint() {
	return restpoint;
}

public void setRestpoint(String restpoint) {
	this.restpoint = restpoint;
}

public String getConsid() {
	return consid;
}

public void setConsid(String consid) {
	this.consid = consid;
}

public static long getSerialversionuid() {
	return serialVersionUID;
}

}
