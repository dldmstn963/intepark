package com.c4.intepark.td.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c4.intepark.td.model.service.TdService;

@Controller
public class TdController {
	private static final Logger logger = LoggerFactory.getLogger(TdController.class);
	
	public TdController() {
		
	}
	
	@Autowired
	private TdService tdService;
	
	@RequestMapping("moveTdMake.do")
	public String moveTdMake() {
		return "3d/3dmake";
	}
	
	
	
	
}
