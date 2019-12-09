package com.c4.intepark.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.calendar.model.service.CalendarService;

@Controller
public class CalendarController {
	
	
	  @Autowired 
	  private CalendarService calendarService;
	 
	
	public CalendarController() {}
}
