package com.c4.intepark.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

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

	public ArrayList<Calendar> selectCalendar(String consid) {
		List<Calendar> list = session.selectList("calendarMapper.selectCalendar", consid);
		return (ArrayList<Calendar>)list;
	}

	public int updateCalendar(Calendar calendar) {
		return session.update("calendarMapper.updateCalendar", calendar);
	}

	public int deleteCalendar(String cno) {
		return session.delete("calendarMapper.deleteCalendar", cno);
	}
	
	
}
