package com.c4.intepark.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatDao")
public class ChatDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public ChatDao() {}
}
