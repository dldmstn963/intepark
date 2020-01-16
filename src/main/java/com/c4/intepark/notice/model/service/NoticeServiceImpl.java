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
		
		return noticeDao.getListCount();
	}

	@Override
	public ArrayList<Notice> selectList(NoticePage noticePage) {
		
		return noticeDao.selectList(noticePage);
	}

	
	@Override
	public void updateReadCount(int noticeno) {
		
		noticeDao.updateReadCount(noticeno);
	}

	@Override
	public Notice selectOne(int noticeno) {
		// TODO Auto-generated method stub
		return noticeDao.selectOne(noticeno);
	}

	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return noticeDao.insertNotice(notice);
	}

	

	
	


	



	

}
