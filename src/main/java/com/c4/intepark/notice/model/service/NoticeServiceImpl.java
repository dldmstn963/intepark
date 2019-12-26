package com.c4.intepark.notice.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.notice.model.service.NoticeService;
import com.c4.intepark.notice.model.dao.NoticeDao;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	public NoticeServiceImpl() {}
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectAll(){
		return noticeDao.selectAll();
	}

	@Override
	public ArrayList<Notice> noticeSearch(String search) {
	
		return noticeDao.noticeSearch(search);
	}

	@Override
	public Notice selectOne(int noticeno) {

		return noticeDao.selectOne(noticeno);
	}

	@Override
	public Notice noticeFileDown(String noticeno) {
		
		return noticeDao.noticeFileDown(noticeno);
	}

	@Override
	public int noticeInsert(Notice notice) {
		
		return noticeDao.noticeInsert(notice);
	}

	@Override
	public Notice noticeUpdate(int idx) {
		// TODO Auto-generated method stub
		return noticeDao.noticeUpdate(idx);
	}

	@Override
	public int noticeDelete(int noticeno) {
		// TODO Auto-generated method stub
		return noticeDao.noticeDelete(noticeno);
	}

	@Override
	public ArrayList<Notice> selectnoticeSearch(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Notice> selectNoticeSearch(String search) {
		// TODO Auto-generated method stub
		return null;
	}



	

}
