package com.c4.intepark.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.calendar.model.dao.CalendarDao;
import com.c4.intepark.calendar.model.vo.Calendar;

@Service("calendarService")
public class CalendarSerivceImpl implements CalendarService{

	  @Autowired 
	  private CalendarDao calendarDao;

	@Override
	public int insertCalendar(Calendar calendar) {
		return calendarDao.insertCalendar(calendar);
	}

	@Override
	public ArrayList<Calendar> selectCalendar(String consid) {
		return calendarDao.selectCalendar(consid);
	}

	@Override
	public int updateCalendar(Calendar calendar) {
		return calendarDao.updateCalendar(calendar);
	}

	@Override
	public int deleteCalendar(String consid) {
		return calendarDao.deleteCalendar(consid);
	}
	 
	  
}
