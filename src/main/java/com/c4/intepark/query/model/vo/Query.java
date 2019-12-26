package com.c4.intepark.query.model.vo;

import java.sql.Date;
import java.io.Serializable;

public class Query implements java.io.Serializable {
	private static final long serialVersionUID = 1444L;
	
	private int queryno;
	private String querytitle;
	private String querycontent;
	private int querycount;
	private java.sql.Date querydate;
	private String querywriter;
	private int queryref;
	private int queryreplyref;
	private int queryreplylev;
	private int queryreplyseq;

	public Query() {}

	public Query(int queryno, String querytitle, String querycontent, int querycount, Date querydate,
			String querywriter, int queryref, int queryreplyref, int queryreplylev, int queryreplyseq) {
		super();
		this.queryno = queryno;
		this.querytitle = querytitle;
		this.querycontent = querycontent;
		this.querycount = querycount;
		this.querydate = querydate;
		this.querywriter = querywriter;
		this.queryref = queryref;
		this.queryreplyref = queryreplyref;
		this.queryreplylev = queryreplylev;
		this.queryreplyseq = queryreplyseq;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getQueryno() {
		return queryno;
	}

	public String getQuerytitle() {
		return querytitle;
	}

	public String getQuerycontent() {
		return querycontent;
	}

	public int getQuerycount() {
		return querycount;
	}

	public java.sql.Date getQuerydate() {
		return querydate;
	}

	public String getQuerywriter() {
		return querywriter;
	}

	public int getQueryref() {
		return queryref;
	}

	public int getQueryreplyref() {
		return queryreplyref;
	}

	public int getQueryreplylev() {
		return queryreplylev;
	}

	public int getQueryreplyseq() {
		return queryreplyseq;
	}

	public void setQueryno(int queryno) {
		this.queryno = queryno;
	}

	public void setQuerytitle(String querytitle) {
		this.querytitle = querytitle;
	}

	public void setQuerycontent(String querycontent) {
		this.querycontent = querycontent;
	}

	public void setQuerycount(int querycount) {
		this.querycount = querycount;
	}

	public void setQuerydate(java.sql.Date querydate) {
		this.querydate = querydate;
	}

	public void setQuerywriter(String querywriter) {
		this.querywriter = querywriter;
	}

	public void setQueryref(int queryref) {
		this.queryref = queryref;
	}

	public void setQueryreplyref(int queryreplyref) {
		this.queryreplyref = queryreplyref;
	}

	public void setQueryreplylev(int queryreplylev) {
		this.queryreplylev = queryreplylev;
	}

	public void setQueryreplyseq(int queryreplyseq) {
		this.queryreplyseq = queryreplyseq;
	}

	@Override
	public String toString() {
		return "Query [queryno=" + queryno + ", querytitle=" + querytitle + ", querycontent=" + querycontent
				+ ", querycount=" + querycount + ", querydate=" + querydate + ", querywriter=" + querywriter
				+ ", queryref=" + queryref + ", queryreplyref=" + queryreplyref + ", queryreplylev=" + queryreplylev
				+ ", queryreplyseq=" + queryreplyseq + "]";
	}
	
	
	
	
	
	
	
	
}










