package com.c4.intepark.point.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.auction.model.dao.AuctionDao;
import com.c4.intepark.point.model.dao.PointDao;
import com.c4.intepark.point.model.vo.Point;

@Service("pointService")
public class PointServiceImpl implements PointService{

	@Autowired
	private PointDao pointDao;
	
	public int pointInsert(Point point) {
		return 0;
		
	}
	public ArrayList<Point> pointList() {
		return null;
		
	}
}
