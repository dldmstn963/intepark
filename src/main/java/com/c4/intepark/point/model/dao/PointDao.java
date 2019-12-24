package com.c4.intepark.point.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.point.model.vo.Point;

@Repository("pointDao")
public class PointDao {
	@Autowired
	private SqlSessionTemplate mybatisSession;

	public int pointInsert() {
		return 0;
		
	}
	public ArrayList<Point> pointList() {
		return null;
		
	}
}
