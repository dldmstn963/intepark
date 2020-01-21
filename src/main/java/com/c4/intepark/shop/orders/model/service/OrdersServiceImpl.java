package com.c4.intepark.shop.orders.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsReview;
import com.c4.intepark.shop.goods.model.vo.Inquiry;
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
	public ArrayList<AllOrders> selectmoveConsOrderList4(Paging p) {
		return ordersDao.selectmoveConsOrderList4(p);
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

	@Override
	public ArrayList<GoodsReview> selectmoveConsReviewList(Paging p) {
		return ordersDao.selectmoveConsReviewList(p);
	}

	@Override
	public ArrayList<Inquiry> selectmoveconsInquiryList(Paging p) {
		return ordersDao.selectmoveconsInquiryList(p);
	}

	@Override
	public int selectConsOrderListAllListCount(String consid) {
		return ordersDao.selectConsOrderListAllListCount(consid);
	}

	@Override
	public int selectconsReviewListAllListCount(String consid) {
		return ordersDao.selectconsReviewListAllListCount(consid);
	}

	@Override
	public int selectConsInquiryListAllListCount(String consid) {
		return ordersDao.selectConsInquiryListAllListCount(consid);
	}

	@Override
	public int updateConsOrders4(Orders orders) {
		return ordersDao.updateConsOrders4(orders);
	}

	@Override
	public AllOrders selectordersDetail(int ordernum) {
		return ordersDao.selectordersDetail(ordernum);
	}

	@Override
	public InteUser selectOrdersUser(String userid) {
		return ordersDao.selectOrdersUser(userid);
	}

	@Override
	public int deleteInquiry(String inquirynum) {
		return ordersDao.deleteInquiry(inquirynum);
	}

	@Override
	public int deleteReviewcheck(String reviewnum) {
		return ordersDao.deleteReviewcheck(reviewnum);
	}

	@Override
	public int deleteGoodscheck(String goodsnum) {
		return ordersDao.deleteGoodscheck(goodsnum);
	}

	@Override
	public int updateOrderscheck(String ordernum) {
		return ordersDao.updateOrderscheck(ordernum);
	}

	@Override
	public Inquiry selectInquiry(int inquirynum) {
		return ordersDao.selectInquiry(inquirynum);
	}

	@Override
	public ArrayList<Orders> selectMyOrderAll(String userId) {
		return ordersDao.selectMyOrderAll(userId);
	}

	@Override
	public AllOrders selectOrderDetail(int ordernum) {
		return ordersDao.selectOrderDetail(ordernum);
	}

	@Override
	public ArrayList<GoodsReview> selectmoveConsReviewList(String consid) {
		return ordersDao.selectmoveConsReviewList(consid);
	}

	@Override
	public ArrayList<Inquiry> selectmoveconsInquiryList(String consid) {
		return ordersDao.selectmoveconsInquiryList(consid);
	}

	@Override
	public ArrayList<AllOrders> selectmoveConsOrderList4(String consid) {
		return ordersDao.selectmoveConsOrderList4(consid);
	}

	
	
	
}
