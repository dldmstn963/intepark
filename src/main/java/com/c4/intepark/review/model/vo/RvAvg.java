package com.c4.intepark.review.model.vo;

import org.springframework.stereotype.Component;

@Component
public class RvAvg implements java.io.Serializable {
	private static final long serialVersionUID = 5302L;
	
	private double rvavg;	//리뷰평균점수
	private int count;	//총 갯수
	private String consid;
	
	public RvAvg() {}

	public RvAvg(double rvavg, int count, String consid) {
		super();
		this.rvavg = rvavg;
		this.count = count;
		this.consid = consid;
	}

	public double getRvavg() {
		return rvavg;
	}

	public void setRvavg(double rvavg) {
		this.rvavg = rvavg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	@Override
	public String toString() {
		return "RvAvg [rvavg=" + rvavg + ", count=" + count + ", consid=" + consid + "]";
	}

	
	
	
}
