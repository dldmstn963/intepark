package com.c4.intepark.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("calendarDao")
public class CalendarDao {

	
	  @Autowired 
	  private SqlSessionTemplate session;
	 
	
	public CalendarDao() {}
	
	
}
