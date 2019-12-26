package com.c4.intepark.faq.model.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.faq.model.vo.Faq;
import com.c4.intepark.faq.model.service.FaqService;

@Repository("faqDao")
public class FaqDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public FaqDao() {}

	public ArrayList<Faq> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Faq selectOne(int faqno) {
		// TODO Auto-generated method stub
		return null;
	}

	public int faqinsert(Faq faq) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Faq faqUpdate(Faq faq) {
		// TODO Auto-generated method stub
		return null;
	}

	public int faqDelete(int faqno) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
