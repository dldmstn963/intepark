package com.c4.intepark.shop.orders.model.service;

import java.util.ArrayList;

import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.orders.model.vo.Dlvylist;
import com.c4.intepark.shop.orders.model.vo.Orders;
import com.c4.intepark.shop.orders.model.vo.Requests;

public interface OrdersService {

	ArrayList<Dlvylist> selectDlvyList(Paging p);

	int selectDlvylistCount(String userid);

	int insertDlvyList(Dlvylist dlvylist);

	int insertRequests(Requests requests);

	int insertOrders(Orders orders);

}
