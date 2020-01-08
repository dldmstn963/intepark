package com.c4.intepark.shop.orders.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.orders.model.service.OrdersService;
import com.c4.intepark.shop.orders.model.vo.AllOrders;
import com.c4.intepark.shop.orders.model.vo.Dlvylist;
import com.c4.intepark.shop.orders.model.vo.Orders;
import com.c4.intepark.shop.orders.model.vo.Requests;
import com.c4.intepark.shop.orders.model.vo.Shbasket;

@Controller
public class OrdersController {
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);

	public OrdersController() {
	}

	@Autowired
	private OrdersService ordersService;

	@RequestMapping(value = "moveorderinsert4.do", method = RequestMethod.POST)
	public String moveorderinsert(HttpServletRequest request, Orders orders) {
		logger.info("결제 창으로 이동");

		ArrayList<Dlvylist> list = ordersService.selectDlvyList(orders.getUserid());
		ArrayList<Requests> list2 = ordersService.selectRequests(orders.getUserid());
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("orders", orders);

		return "shopping/checkout";
	}

	@RequestMapping(value = "orderinsert4.do", method = RequestMethod.POST)
	public String orderinsert(@SessionAttribute("loginUser") InteUser user, HttpServletRequest request, Orders orders) {
		logger.info("결제");
		logger.info("결제 정보 확인 : " + orders);
		if (Integer.parseInt(request.getParameter("dlvynum")) != 0) {
			orders.setDlvynum(Integer.parseInt(request.getParameter("dlvynum")));
		} else if (Integer.parseInt(request.getParameter("dlvynum")) == 0) {
			Dlvylist dlvylist = new Dlvylist();
			dlvylist.setAddress(request.getParameter("address"));
			dlvylist.setAddressee(request.getParameter("addressee"));
			dlvylist.setDlvyname(request.getParameter("dlvyname"));
			dlvylist.setPhone(Integer.parseInt(request.getParameter("phone")));
			dlvylist.setUserid(user.getUserid());
			int result = ordersService.insertDlvyList(dlvylist);
		}

		if (Integer.parseInt(request.getParameter("requestnum")) != 0) {
			orders.setRequestnum(Integer.parseInt(request.getParameter("requestnum")));
		} else if (Integer.parseInt(request.getParameter("requestnum")) == 0) {
			Requests requests = new Requests();
			requests.setRequestcn(request.getParameter("requestcn"));
			requests.setUserid(user.getUserid());
			int result2 = ordersService.insertRequests(requests);
		}
		int result3 = ordersService.insertOrders(orders);

		return "shopping/checkout";
	}

	@RequestMapping("shbasketinsert4.do")
	public void shbasketinsert4(HttpServletRequest request, Orders orders, HttpServletResponse response)
			throws IOException {
		logger.info("장바구니 담기");
		logger.info(orders.toString());
		Shbasket sh = new Shbasket();
		sh.setGoodsnum(orders.getGoodsnum());
		sh.setUserid(orders.getUserid());
		sh.setQuantity(orders.getOrderquantity());
		int result = ordersService.insertShbasket(sh);

		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('장바구니에 담았습니다');");
		out.println("window.location = document.referrer;");
		out.println("</script>");
	}

	@RequestMapping("moveshbasket42.do")
	public String moveshbasket42(@SessionAttribute("loginUser") InteUser user, HttpServletRequest request) {
		logger.info("장바구니 목록 조회 : " + user);
		ArrayList<Shbasket> list = ordersService.selectShbasketList(user.getUserid());
		logger.info(null, list.get(0));
		request.setAttribute("list", list);
		return "shopping/cart";
	}

	@RequestMapping("moveConsOrderList4.do")
	public String moveConsOrderList4(@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request) {
		logger.info("주문 목록 조회 : " + cons);
		ArrayList<AllOrders> list = ordersService.selectmoveConsOrderList4(cons.getConsid());
		request.setAttribute("list", list);
		return "shopping/cons/production/consOrderList4";
	}

	@RequestMapping(value = "moveinsertDlvylist4.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveinsertDlvylist4(@SessionAttribute("loginUser") InteUser user, HttpServletRequest request) {
		logger.info("배송지 목록 조회 : " + user);
		return "shopping/dlvylist";
	}

	@RequestMapping(value = "shbasketdelete4.do", method = RequestMethod.POST)
	public void goodsdelete4(@RequestParam("shbasketnum") int shbasketnum, HttpServletResponse response)
			throws IOException {
		logger.info("장바구니 삭제 : " + shbasketnum);
		int result = ordersService.deleteShbasket(shbasketnum);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}

	@RequestMapping("updateshbasket4.do")
	public void updateshbasket4(Shbasket shbasket, HttpServletResponse response) throws IOException {
		logger.info("장바구니 수정 : " + shbasket.getShbasketnum());
		int result = ordersService.updateShbasket(shbasket);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('수정 성공!');</script>");
			out.println("<script>location.href = document.referrer</script>");
		} else {
			out.println("<script>alert('수정 실패!');</script>");
		}
	}

	@RequestMapping("moveshbasketorderinsert4.do")
	public String moveshbasketorderinsert4(@SessionAttribute("loginUser") InteUser user, HttpServletRequest request) {
		logger.info("장바구니 결제 창으로 이동");
		String[] goodsnum = request.getParameterValues("goodsnum");
		String[] quantity = request.getParameterValues("quantity");
		int[] goodsprice = new int[quantity.length];
		int orderprice = 0;
		for(int i = 0; i < quantity.length; i++) {
			Goods goods = new Goods();
			goods = ordersService.selectGoods(Integer.parseInt(goodsnum[i]));
			goodsprice[i] = goods.getPrice();
			orderprice += (goods.getPrice()*Integer.parseInt(quantity[i]));
			System.out.println("dddddd"+ goodsprice[i]);
		}
		ArrayList<Dlvylist> list = ordersService.selectDlvyList(user.getUserid());
		ArrayList<Requests> list2 = ordersService.selectRequests(user.getUserid());
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("orderprice", orderprice);
		request.setAttribute("goodsnum", goodsnum);
		request.setAttribute("quantity", quantity);
		request.setAttribute("goodsprice", goodsprice);
		

		return "shopping/shbasketcheckout";
	}

}
