package com.c4.intepark.notice.model.vo;

public class NoticePage {
	private static final long serialVersionUID = 1337L;
	
	private int currentPage;
	private int limit;
	
	public NoticePage() {}

	public NoticePage(int currentPage, int limit) {
		super();
		this.currentPage = currentPage;
		this.limit = limit;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	@Override
	public String toString() {
		return "NoticePage [currentPage=" + currentPage + ", limit=" + limit + "]";
	}

}
