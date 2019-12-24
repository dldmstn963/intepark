package com.c4.intepark.point.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.c4.intepark.auction.model.service.AuctionService;
import com.c4.intepark.point.model.service.PointService;
import com.c4.intepark.point.model.vo.Point;

@Controller
public class PointController {
	@Autowired
	private PointService pointService;
	
public String pointInsert() {
	return null;
	
}
public ArrayList<Point> pointList() {
	pointService.pointList();
	return null;
	
}
}
