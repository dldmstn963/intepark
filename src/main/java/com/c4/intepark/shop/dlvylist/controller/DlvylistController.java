package com.c4.intepark.shop.dlvylist.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.shop.dlvylist.model.service.DlvylistService;

@Controller
public class DlvylistController {
	private static final Logger logger = LoggerFactory.getLogger(DlvylistController.class);
	
	public DlvylistController() {}
	
	@Autowired
	private DlvylistService dlvylistService;
	
	
}
