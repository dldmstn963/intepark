package com.c4.intepark.shop.orders.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.orders.model.dao.OrdersDao;
import com.c4.intepark.shop.orders.model.vo.AllOrders;
import com.c4.intepark.shop.orders.model.vo.Dlvylist;
import com.c4.intepark.shop.orders.model.vo.Orders;
import com.c4.intepark.shop.orders.model.vo.Requests;
import com.c4.intepark.shop.orders.model.vo.Shbasket;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersDao ordersDao;

	@Override
	public ArrayList<Dlvylist> selectDlvyList(String userid) {
		return ordersDao.selectDlvyList(userid);
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

	@Override
	public int insertShbasket(Shbasket sh) {
		return ordersDao.insertShbasket(sh);
	}

	@Override
	public ArrayList<Shbasket> selectShbasketList(String userid) {
		return ordersDao.selectShbasketList(userid);
	}

	@Override
	public ArrayList<AllOrders> selectmoveConsOrderList4(String consid) {
		return ordersDao.selectmoveConsOrderList4(consid);
	}

	@Override
	public ArrayList<Requests> selectRequests(String userid) {
		return ordersDao.selectRequests(userid);
	}

	@Override
	public int deleteShbasket(int shbasketnum) {
		return ordersDao.deleteShbasket(shbasketnum);
	}

	@Override
	public int updateShbasket(Shbasket shbasket) {
		return ordersDao.updateShbasket(shbasket);
	}

	@Override
	public Shbasket selectShbasket(int shbasketnum) {
		return ordersDao.selectShbasket(shbasketnum);
	}

	@Override
	public Goods selectGoods(int goodsnum) {
		return ordersDao.selectGoods(goodsnum);
	}

	
	
	
}
