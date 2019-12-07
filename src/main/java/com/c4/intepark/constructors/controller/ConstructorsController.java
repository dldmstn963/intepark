package com.c4.intepark.constructors.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.c4.intepark.constructors.service.ConstructorsService;
import com.c4.intepark.constructors.vo.Constructors;

@Controller
public class ConstructorsController {
	
	@Autowired
	private ConstructorsService consService;
	
	public ConstructorsController() {}
	
	@RequestMapping(value="conslogCheck6.do", method=RequestMethod.POST)
	public void consLoginMethod(Constructors cons, HttpSession session) {
		System.out.println(cons);
		Constructors loginCons= consService.loginCheck(cons);
		System.out.println(loginCons);
	}
	

}
