package com.c4.intepark.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.calendar.model.dao.CalendarDao;

@Controller("calendarService")
public class CalendarSerivceImpl implements CalendarService{

	
	  @Autowired 
	  private CalendarDao calendarDao;
	 
	  
}