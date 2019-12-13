package com.c4.intepark.calendar.model.service;

import java.util.ArrayList;

import com.c4.intepark.calendar.model.vo.Calendar;

public interface CalendarService {

	int insertCalendar(Calendar calendar);

	ArrayList<Calendar> selectCalendar(String consid);
	
}
