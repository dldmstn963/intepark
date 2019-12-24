package com.c4.intepark.point.model.service;

import java.util.ArrayList;

import com.c4.intepark.point.model.vo.Point;

public interface PointService {
int pointInsert(Point point);
ArrayList<Point> pointList();
}
