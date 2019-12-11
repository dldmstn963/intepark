package com.c4.intepark.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.calendar.model.vo.Calendar;

@Repository("calendarDao")
public class CalendarDao {

	
	  @Autowired 
	  private SqlSessionTemplate session;
	 
	public CalendarDao() {}

	public int insertCalendar(Calendar calendar) {
		return session.insert("calendarMapper.insertCalendar", calendar);
	}
	
	
}
