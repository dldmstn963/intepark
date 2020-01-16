package com.c4.intepark.notice.model.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.notice.model.vo.Notice;
import com.c4.intepark.notice.model.vo.NoticePage;
import com.c4.intepark.common.CommonPage;
import com.c4.intepark.notice.model.service.NoticeService;

@Repository("noticeDao")
public class NoticeDao {
	
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	
	public NoticeDao() {}
	


	public int getListCount() {
		
		return mybatisSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectList(NoticePage noticePage) {
		
		List<Notice> list = mybatisSession.selectList("noticeMapper.selectList",noticePage);
		return (ArrayList<Notice>)list;
	}

	//조회수 및 페이징
	public void updateReadCount(int noticeno) {
		mybatisSession.update("noticeMapper.updateReadCount",noticeno);
		
	}


	//글 상세보기
	public Notice selectOne(int noticeno) {
		
		return mybatisSession.selectOne("noticeMapper.selectOne",noticeno);
	}



	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return mybatisSession.insert("noticeMapper.insertNotice",notice);
	}


	

	

}
