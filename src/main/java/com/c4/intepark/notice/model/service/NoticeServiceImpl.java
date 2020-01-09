package com.c4.intepark.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.notice.model.vo.NoticePage;
import com.c4.intepark.notice.model.service.NoticeService;
import com.c4.intepark.common.CommonPage;
import com.c4.intepark.notice.model.dao.NoticeDao;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	public NoticeServiceImpl() {}
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return noticeDao.getListCount();
	}

	@Override
	public ArrayList<Notice> selectList(NoticePage noticePage) {
		// TODO Auto-generated method stub
		return noticeDao.selectList(noticePage);
	}
	


	



	

}
