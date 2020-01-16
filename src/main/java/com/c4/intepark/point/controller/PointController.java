package com.c4.intepark.point.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.c4.intepark.constructors.model.vo.Constructors;
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
@RequestMapping(value="point2.do", method=RequestMethod.POST)
public void insertPoint(HttpServletRequest request, Point point) {
	String consid = request.getParameter("consid");
	int restpoint = Integer.parseInt(point.getRestpoint());
	int chargepoint = Integer.parseInt(point.getChargepoint());
	String sumrestpoint = Integer.toString(restpoint + chargepoint);
	point.setRestpoint(sumrestpoint);
	int result = pointService.pointInsert(point);
	
}
@RequestMapping("pointAdd2.do")
public String selectPointEnrollPage(HttpServletRequest request) {
String consid = request.getParameter("consid");
Point point = pointService.pointOne(consid);

request.setAttribute("point", point);
	return "point/point";
}
}
