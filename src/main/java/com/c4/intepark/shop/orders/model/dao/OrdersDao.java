package com.c4.intepark.shop.orders.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.orders.model.vo.Dlvylist;
import com.c4.intepark.shop.orders.model.vo.Orders;
import com.c4.intepark.shop.orders.model.vo.Requests;

@Repository("ordersDao")
public class OrdersDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public OrdersDao() {}

	public ArrayList<Dlvylist> selectDlvyList(Paging p) {
		List list = mybatis.selectList("orderMapper.selectDlvyList",p);
		return (ArrayList<Dlvylist>) list;
	}

	public int selectDlvylistCount(String userid) {
		return mybatis.selectOne("orderMapper.selectDlvylistCount",userid);
	}

	public int insertDlvyList(Dlvylist dlvylist) {
		return mybatis.insert("orderMapper.insertDlvyList",dlvylist);
	}

	public int insertRequests(Requests requests) {
		return mybatis.insert("orderMapper.insertRequests",requests);
	}

	public int insertOrders(Orders orders) {
		return mybatis.insert("orderMapper.insertOrders",orders);
	}
	
}
