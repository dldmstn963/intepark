package com.c4.intepark.shop;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Paging implements Serializable{
	private static final long serialVersionUID = 4007L;
	
	private int listCount;
	private int currentPage = 1;
	private int limit = 10;
	private int maxPage;
	private int beginPage;
	private int endPage;
	private int startRow;
	private int endRow;
	
	public Paging() {
		super();
	}
	
	public Paging(int listCount) {
		super();
		this.listCount = listCount;
		maxPage = listCount / limit;
		if (listCount % limit > 0) {
			maxPage++;
		}
		if (currentPage % limit == 0) {
			beginPage = currentPage - 9;
		} else {
			beginPage = (currentPage / limit) * limit + 1;
		}
		endPage = beginPage + 9;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		startRow = (currentPage * limit) - 9;
		endRow = currentPage * limit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		maxPage = listCount / limit;
		if (listCount % limit > 0) {
			maxPage++;
		}
		if (currentPage % limit == 0) {
			beginPage = currentPage - 9;
		} else {
			beginPage = (currentPage / limit) * limit + 1;
		}
		endPage = beginPage + 9;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		startRow = (currentPage * limit) - 9;
		endRow = currentPage * limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getEndRow() {
		return endRow;
	}

	@Override
	public String toString() {
		return "Paging [currentPage=" + currentPage + ", maxPage=" + maxPage + ", beginPage=" + beginPage + ", endPage="
				+ endPage + ", limit=" + limit + ", startRow=" + startRow + ", endRow=" + endRow + ", listCount="
				+ listCount + "]";
	}
	
	
}
