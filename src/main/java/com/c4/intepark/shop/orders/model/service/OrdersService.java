package com.c4.intepark.shop.orders.model.service;

import java.util.ArrayList;

import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsReview;
import com.c4.intepark.shop.goods.model.vo.Inquiry;
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

	ArrayList<AllOrders> selectmoveConsOrderList4(Paging p);

	ArrayList<Requests> selectRequests(String userid);

	int deleteShbasket(int shbasketnum);

	int updateShbasket(Shbasket shbasket);

	Shbasket selectShbasket(int shbasketnum);

	Goods selectGoods(int goodsnum);

	ArrayList<GoodsReview> selectmoveConsReviewList(Paging p);

	ArrayList<Inquiry> selectmoveconsInquiryList(Paging p);

	int selectConsOrderListAllListCount(String consid);

	int selectconsReviewListAllListCount(String consid);

	int selectConsInquiryListAllListCount(String consid);

	int updateConsOrders4(Orders orders);

	AllOrders selectordersDetail(int ordernum);

	InteUser selectOrdersUser(String userid);

	int deleteInquiry(String inquirynum);

	int deleteReviewcheck(String reviewnum);

	int deleteGoodscheck(String goodsnum);

	int updateOrderscheck(String ordernum);

	Inquiry selectInquiry(int inquirynum);

	ArrayList<Orders> selectMyOrderAll(String userId);

	AllOrders selectOrderDetail(int ordernum);

	ArrayList<GoodsReview> selectmoveConsReviewList(String consid);

	ArrayList<Inquiry> selectmoveconsInquiryList(String consid);

	ArrayList<AllOrders> selectmoveConsOrderList4(String consid);


}
