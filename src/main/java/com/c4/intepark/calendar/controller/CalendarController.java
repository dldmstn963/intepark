package com.c4.intepark.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.c4.intepark.calendar.model.service.CalendarService;
import com.c4.intepark.calendar.model.vo.Calendar;

@Controller
public class CalendarController {
	
	
	  @Autowired 
	  private CalendarService calendarService;
	
	  public CalendarController() {}
	  
	  @RequestMapping(value="insertCalendar3.do", method=RequestMethod.POST)
	  public String insertCalendar(Calendar calendar, Model model) {
		
		  int result = calendarService.insertCalendar(calendar);
		  
		  String viewFileName = "calendar/calendarManagement";
		  if(result <= 0) {
		  model.addAttribute("message", "일정 등록 실패"); 
		  viewFileName = "common/error"; 
		  }
  
		  return viewFileName;
	  }
	  
	  @RequestMapping("calendar3.do")
	  public String selectCalendar() {
		  return "calendar/calendarManagement";
	  }
	  
}
