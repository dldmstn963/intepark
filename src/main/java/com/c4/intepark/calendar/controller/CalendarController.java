package com.c4.intepark.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c4.intepark.calendar.model.service.CalendarService;

@Controller
public class CalendarController {
	
	
	  @Autowired 
	  private CalendarService calendarService;
	
	  public CalendarController() {}
	  
	  @RequestMapping("insertCalendar3.do")
	  public String insertCalendar() {
		  return "calendar/insertCalendar";
	  }
	  
	  @RequestMapping("calendar3.do")
	  public String selectCalendar() {
		  return "calendar/calendarManagement";
	  }
	  
}
