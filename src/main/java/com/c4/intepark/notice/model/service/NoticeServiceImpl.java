package com.c4.intepark.notice.model.service;

import java.util.ArrayList;

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

}
