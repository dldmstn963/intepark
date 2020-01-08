package com.c4.intepark.shop.orders.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.orders.model.vo.AllOrders;
import com.c4.intepark.shop.orders.model.vo.Dlvylist;
import com.c4.intepark.shop.orders.model.vo.Orders;
import com.c4.intepark.shop.orders.model.vo.Requests;
import com.c4.intepark.shop.orders.model.vo.Shbasket;

@Repository("ordersDao")
public class OrdersDao {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public OrdersDao() {}

	public ArrayList<Dlvylist> selectDlvyList(String userid) {
		List list = mybatis.selectList("orderMapper.selectDlvyList",userid);
		return (ArrayList<Dlvylist>) list;
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

	public int insertShbasket(Shbasket sh) {
		return mybatis.insert("orderMapper.insertShbasket",sh);
	}

	public ArrayList<Shbasket> selectShbasketList(String userid) {
		List list = mybatis.selectList("orderMapper.selectShbasketList", userid);
		return (ArrayList<Shbasket>) list;

	}

	public ArrayList<AllOrders> selectmoveConsOrderList4(String consid) {
		List list = mybatis.selectList("orderMapper.selectmoveConsOrderList4", consid);
		return (ArrayList<AllOrders>) list;
	}

	public ArrayList<Requests> selectRequests(String userid) {
		List list = mybatis.selectList("orderMapper.selectRequests",userid);
		return (ArrayList<Requests>) list;
	}

	public int deleteShbasket(int shbasketnum) {
		return mybatis.delete("orderMapper.deleteShbasket",shbasketnum);
	}

	public int updateShbasket(Shbasket shbasket) {
		return mybatis.update("orderMapper.updateShbasket",shbasket);
	}

	public Shbasket selectShbasket(int shbasketnum) {
		return mybatis.selectOne("orderMapper.selectShbasket",shbasketnum);
	}

	public Goods selectGoods(int goodsnum) {
		return mybatis.selectOne("orderMapper.selectGoods",goodsnum);
	}

	
}
