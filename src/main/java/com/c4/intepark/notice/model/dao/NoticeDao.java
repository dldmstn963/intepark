package com.c4.intepark.notice.model.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.notice.model.service.NoticeService;

@Repository("noticeDao")
public class NoticeDao {
	
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	
	public NoticeDao() {}
	
	public ArrayList<Notice> selectAll(){
		
		List<Notice> list = mybatisSession.selectList("noticeMapper.selectList");
		return (ArrayList<Notice>)list;
	}

	

}
