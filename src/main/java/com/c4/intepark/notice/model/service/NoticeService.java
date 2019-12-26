package com.c4.intepark.notice.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.c4.intepark.notice.model.vo.Notice;

public interface NoticeService {
 
	ArrayList<Notice> selectAll();
	
	

	Notice selectOne(int noticeno);



	ArrayList<Notice> noticeSearch(String search);



	Notice noticeFileDown(String noticeno);



	int noticeInsert(Notice notice);



	Notice noticeUpdate(int idx);



	int noticeDelete(int noticeno);



	ArrayList<Notice> selectnoticeSearch(String search);



	ArrayList<Notice> selectNoticeSearch(String search);



	




	

	



}
