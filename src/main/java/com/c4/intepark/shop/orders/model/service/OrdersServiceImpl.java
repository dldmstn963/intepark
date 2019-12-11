package com.c4.intepark.shop.orders.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.orders.model.dao.OrdersDao;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersDao ordersDao;
	
	
}
