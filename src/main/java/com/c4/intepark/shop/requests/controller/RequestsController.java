package com.c4.intepark.shop.requests.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.shop.requests.model.service.RequestsService;

@Controller
public class RequestsController {
	private static final Logger logger = LoggerFactory.getLogger(RequestsController.class);
	
	public RequestsController() {}
	
	@Autowired
	private RequestsService requestService;
	
	
}
