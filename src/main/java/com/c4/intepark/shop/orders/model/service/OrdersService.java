package com.c4.intepark.shop.orders.model.service;

import java.util.ArrayList;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.orders.model.vo.AllOrders;
import com.c4.intepark.shop.orders.model.vo.Dlvylist;
import com.c4.intepark.shop.orders.model.vo.Orders;
import com.c4.intepark.shop.orders.model.vo.Requests;
import com.c4.intepark.shop.orders.model.vo.Shbasket;

public interface OrdersService {

	ArrayList<Dlvylist> selectDlvyList(String userid);

	int insertDlvyList(Dlvylist dlvylist);

	int insertRequests(Requests requests);

	int insertOrders(Orders orders);

	int insertShbasket(Shbasket sh);

	ArrayList<Shbasket> selectShbasketList(String userid);

	ArrayList<AllOrders> selectmoveConsOrderList4(String consid);

	ArrayList<Requests> selectRequests(String userid);

	int deleteShbasket(int shbasketnum);

	int updateShbasket(Shbasket shbasket);

	Shbasket selectShbasket(int shbasketnum);

	Goods selectGoods(int goodsnum);


}
