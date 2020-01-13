package com.c4.intepark.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.common.CommonPage;
import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.notice.model.vo.NoticePage;

public interface NoticeService {

	int getListCount();

	ArrayList<Notice> selectList(NoticePage noticePage);
 



	




	

	



}
