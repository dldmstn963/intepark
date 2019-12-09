package com.c4.intepark.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.point.model.service.PointService;

@Controller
public class PointController {

	@Autowired
	private PointService pointService;
}
