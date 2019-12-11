package com.c4.intepark.shop.inquiry.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.shop.inquiry.model.service.InquiryService;

@Controller
public class InquiryController {
	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
	
	public InquiryController() {}
	
	@Autowired
	private InquiryService inquiryService;
	
	
}
