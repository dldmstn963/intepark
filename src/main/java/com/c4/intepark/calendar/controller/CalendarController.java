package com.c4.intepark.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.c4.intepark.calendar.model.service.CalendarService;
import com.c4.intepark.calendar.model.vo.Calendar;
import com.c4.intepark.constructors.model.vo.Constructors;

@Controller
public class CalendarController {
	
	
	  @Autowired 
	  private CalendarService calendarService;
	
	  public CalendarController() {}
	  
	  @RequestMapping("calendar3.do")
	  public String showCalendar() {
		  return "calendar/calendarManagement";
	  }
	  
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
	  
	  @PostMapping("selectCalendar3.do")
	  public void selectCalendar(HttpSession session, HttpServletResponse response) throws IOException {
		  Constructors cons = (Constructors)session.getAttribute("loginCons");
		  String consid = cons.getConsid();
		  
		  ArrayList<Calendar> list = calendarService.selectCalendar(consid);
		  System.out.println(list);
		  
		  JSONObject sendJson = new JSONObject();
		  JSONArray jarr = new JSONArray();
		  
		  for(Calendar c : list) {
			  JSONObject job = new JSONObject();
			  job.put("ctitle", URLEncoder.encode(c.getCtitle(), "UTF-8"));
			  job.put("cstart", c.getCstart().toString());
			  job.put("cend", c.getCend().toString());
			  job.put("ccolor", c.getCcolor());
			  job.put("cno", c.getCno());
			  if(c.getCcontent() != null) {
			  job.put("ccontent", URLEncoder.encode(c.getCcontent(), "UTF-8"));
			  }
			  
			  jarr.add(job);
		  }
		  
		  sendJson.put("list", jarr);
		  
		  response.setContentType("application/json; charset=utf-8");
		  PrintWriter out = response.getWriter();
		  out.write(sendJson.toJSONString());
		  out.flush();
		  out.close();
 
	  }
	  
	  @RequestMapping("updateCalendar3.do")
	  public String updateCalendar(Calendar calendar, Model model) {
		  int result = calendarService.updateCalendar(calendar);
		  
		  String viewFileName = "calendar/calendarManagement"; 
		  if(result <=0) {
			  viewFileName = "common/error"; 
			  model.addAttribute("message", "일정 출력 실패"); } 
		  return viewFileName;
	  }
	  
	  @RequestMapping("deleteCalendar3.do")
	  public String deleteCalendar(@RequestParam("consid") String consid, Model model) {
		  int result = calendarService.deleteCalendar(consid);
		  
		  String viewFileName = "calendar/calendarManagement"; 
		  if(result <=0) {
			  viewFileName = "common/error"; 
			  model.addAttribute("message", "일정 출력 실패"); } 
		  return viewFileName;
	  }
	  
}
