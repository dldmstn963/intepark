package com.c4.intepark.common;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class CommonPage implements java.io.Serializable{
	private static final long serialVersionUID = 6543L;
	private int listCount; //전체 페이지 갯수
	private int listSize; //페이지당 목록수
	private int pageSize; //페이지바의 페이지 갯수
	private int currentPage; //현재페이지
	private int maxPage;//최대 페이지수 ex)35
	private int beginPage;//시작페이지 ex) 1
	private int endPage;//목록의 마지막페이지 ex) 10
	private int startList;//페이지조회시작#{StartList}
	private int endList;//페이지조회마지막#{endList}
	private String selectoption;
	private String searchtext;
	private String userid;
	private String username;
	private String startdate;
	private String enddate;
	private String memberstate;
	
	public CommonPage() {}
	


	public CommonPage(int listCount, int listSize, int pageSize, int currentPage, int maxPage, int beginPage,
			int endPage, int startList, int endList, String selectoption, String searchtext, String userid,
			String username, String startdate, String enddate, String memberstate) {
		super();
		this.listCount = listCount;
		this.listSize = listSize;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.maxPage = maxPage;
		this.beginPage = beginPage;
		this.endPage = endPage;
		this.startList = startList;
		this.endList = endList;
		this.selectoption = selectoption;
		this.searchtext = searchtext;
		this.userid = userid;
		this.username = username;
		this.startdate = startdate;
		this.enddate = enddate;
		this.memberstate = memberstate;
	}



	public void pageUpdate(int listsize, int pagesize, int listcount, int currentpage) {
		this.listSize = listsize;
		this.pageSize = pagesize;
		this.listCount = listcount;
		this.currentPage = currentpage;
		
		maxPage = listCount / listSize; 
		//최대페이지수는 전체글 / 페이지당목록수 ex) 35개글이면 35/10 3페이지까지.. 
		//1페이지 1~10 2페이지 11~20 3페이지 21~30 4페이지 이므로
		if(listCount % listSize > 0)
			maxPage++; //나눈값이 0보다 클경우엔 +1페이지를 해준다
		
		beginPage = (currentPage/pageSize) * pageSize +1; 
		//시작페이지는 현재페이지/페이지를 나누고 페이지갯수를 곱한거의+1 ex)1페이지는 1/10*10+1=1, 3페이지도 1
		//근데 10페이지도 페이지바안에 1로 나와야함 1~10 근데 10/10*10+1은 11이나온다 그러므로
		if(currentPage % pageSize ==0) 
			beginPage -=pageSize; // 현재페이지와 페이지사이즈가 동일할경우 10,20.. 10을뺴주면 1 11, 21,....이나온다
		
		
		endPage = beginPage+(pageSize-1);
		//목록의 마지막페이지는 시작페이지에서 마지막페이지-1하고 더해준다 ex)10 = 1+10-1
		//근데 마지막페이지가 20이나왓는데 최대페이지가 15가나오면
		if(endPage>maxPage)
			endPage=maxPage; //최대페이지로 바꾸어준다
		
		startList =(currentPage * listSize)-(listSize-1); //시작목록#{startList}
		endList = currentPage * listSize; //마지막목록#{endList}
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndList() {
		return endList;
	}

	public void setEndList(int endList) {
		this.endList = endList;
	}

	public String getSelectoption() {
		return selectoption;
	}

	public void setSelectoption(String selectoption) {
		this.selectoption = selectoption;
	}

	public String getSearchtext() {
		return searchtext;
	}

	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}



	public String getStartdate() {
		return startdate;
	}



	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}



	public String getEnddate() {
		return enddate;
	}



	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}



	public String getMemberstate() {
		return memberstate;
	}


	public void setMemberstate(String memberstate) {
		this.memberstate = memberstate;
	}


	@Override
	public String toString() {
		return "CommonPage [listCount=" + listCount + ", listSize=" + listSize + ", pageSize=" + pageSize
				+ ", currentPage=" + currentPage + ", maxPage=" + maxPage + ", beginPage=" + beginPage + ", endPage="
				+ endPage + ", startList=" + startList + ", endList=" + endList + ", selectoption=" + selectoption
				+ ", searchtext=" + searchtext + ", userid=" + userid + ", username=" + username + ", startdate="
				+ startdate + ", enddate=" + enddate + ", memberState=" + memberstate + "]";
	}

	

	

}
