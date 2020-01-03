package com.c4.intepark.shop.orders.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.orders.model.dao.OrdersDao;
import com.c4.intepark.shop.orders.model.vo.Dlvylist;
import com.c4.intepark.shop.orders.model.vo.Orders;
import com.c4.intepark.shop.orders.model.vo.Requests;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersDao ordersDao;

	@Override
	public ArrayList<Dlvylist> selectDlvyList(Paging p) {
		return ordersDao.selectDlvyList(p);
	}

	@Override
	public int selectDlvylistCount(String userid) {
		return ordersDao.selectDlvylistCount(userid);
	}

	@Override
	public int insertDlvyList(Dlvylist dlvylist) {
		return ordersDao.insertDlvyList(dlvylist);
	}

	@Override
	public int insertRequests(Requests requests) {
		return ordersDao.insertRequests(requests);
	}

	@Override
	public int insertOrders(Orders orders) {
		return ordersDao.insertOrders(orders);
	}
	
	
}
