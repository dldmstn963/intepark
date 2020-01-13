package com.c4.intepark.shop.orders.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.inteuser.model.vo.InteUser;
import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsReview;
import com.c4.intepark.shop.goods.model.vo.Inquiry;
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
		Paging p = new Paging(ordersService.selectConsOrderListAllListCount(cons.getConsid()));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		p.setMemberid(cons.getConsid());
		ArrayList<AllOrders> list = ordersService.selectmoveConsOrderList4(p);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
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
		for (int i = 0; i < quantity.length; i++) {
			Goods goods = new Goods();
			goods = ordersService.selectGoods(Integer.parseInt(goodsnum[i]));
			goodsprice[i] = goods.getPrice();
			orderprice += (goods.getPrice() * Integer.parseInt(quantity[i]));
			System.out.println("dddddd" + goodsprice[i]);
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

	@RequestMapping("shbasketinsert42.do")
	public void shbasketinsert42(@SessionAttribute("loginUser") InteUser user, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		logger.info("장바구니 담기");
		Shbasket sh = new Shbasket();
		sh.setGoodsnum(Integer.parseInt(request.getParameter("goodsnum")));
		sh.setUserid(user.getUserid());
		sh.setQuantity(1);
		int result = ordersService.insertShbasket(sh);

		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('장바구니에 담았습니다');");
		out.println("window.location = document.referrer;");
		out.println("</script>");
	}

	@RequestMapping("moveconsReviewList4.do")
	public String moveconsReviewList4(@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request) {
		logger.info("리뷰 목록 조회 : " + cons);

		Paging p = new Paging(ordersService.selectconsReviewListAllListCount(cons.getConsid()));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		p.setMemberid(cons.getConsid());
		ArrayList<GoodsReview> list = ordersService.selectmoveConsReviewList(p);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		return "shopping/cons/production/consReviewList";
	}

	@RequestMapping("moveconsInquiryList4.do")
	public String moveconsInquiryList4(@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request) {
		logger.info("문의 목록 조회 : " + cons);
		Paging p = new Paging(ordersService.selectConsInquiryListAllListCount(cons.getConsid()));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		p.setMemberid(cons.getConsid());
		ArrayList<Inquiry> list = ordersService.selectmoveconsInquiryList(p);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		return "shopping/cons/production/consInqueryList";
	}

	@RequestMapping(value = "updateConsOrders4.do", method = RequestMethod.POST)
	public void updateConsOrders4(HttpServletResponse response, Orders orders) throws IOException {
		logger.info("주문 수정 : " + orders);

		int result = ordersService.updateConsOrders4(orders);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('수정 성공!');</script>");
		} else {
			out.println("<script>alert('수정 실패!');</script>");
		}

	}

	@RequestMapping("ordersDetail4.do")
	public String ordersDetail(HttpServletRequest request, @RequestParam("ordernum") int ordernum) {
		logger.info("주문 상세 조회 : " + ordernum);
		AllOrders allOrders = ordersService.selectordersDetail(ordernum);
		InteUser user = ordersService.selectOrdersUser(allOrders.getUserid());
		request.setAttribute("all", allOrders);
		request.setAttribute("user", user);
		return "shopping/cons/production/ordersDetail";
	}

	@RequestMapping(value = "inqueryDelete4.do", method = RequestMethod.POST)
	public void inqueryDelete(HttpServletRequest request, @RequestParam("lists") String checkBox,
			HttpServletResponse response) throws IOException {
		logger.info("문의사항 삭제 : " + checkBox);
		String check[] = checkBox.split(",");
		int result = 0;
		for (int i = 0; i < check.length; i++) {
			result = ordersService.deleteInquiry(check[i]);
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}

	@RequestMapping(value = "deleteReviewcheck4.do", method = RequestMethod.POST)
	public void deleteReviewcheck(HttpServletRequest request, @RequestParam("lists") String checkBox,
			HttpServletResponse response) throws IOException {
		logger.info("리뷰 삭제 : " + checkBox);
		String check[] = checkBox.split(",");
		int result = 0;
		for (int i = 0; i < check.length; i++) {
			result = ordersService.deleteReviewcheck(check[i]);
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}

	@RequestMapping(value = "deleteGoodscheck4.do", method = RequestMethod.POST)
	public void deleteGoodscheck(HttpServletRequest request, @RequestParam("lists") String checkBox,
			HttpServletResponse response) throws IOException {
		logger.info("상품 삭제 : " + checkBox);
		String check[] = checkBox.split(",");
		int result = 0;
		for (int i = 0; i < check.length; i++) {
			result = ordersService.deleteGoodscheck(check[i]);
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}

	@RequestMapping(value = "updateOrderscheck4.do", method = RequestMethod.POST)
	public void updateOrderscheck4(HttpServletRequest request, @RequestParam("lists") String checkBox,
			HttpServletResponse response) throws IOException {
		logger.info("상품 삭제 : " + checkBox);
		String check[] = checkBox.split(",");
		int result = 0;
		for (int i = 0; i < check.length; i++) {
			result = ordersService.updateOrderscheck(check[i]);
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('주문 취소 성공!');</script>");
		} else {
			out.println("<script>alert('주문 취소 실패!');</script>");
		}
	}

	@RequestMapping("moveinquiryDetail4.do")
	public String moveinquiryDetail(@RequestParam("inquirynum") int inquirynum, HttpServletRequest request) {
		logger.info("상품 상세 조회" + inquirynum);
		System.out.println("----------------------------");
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println(name + " : " + request.getParameter(name));
		}
		System.out.println("----------------------------");
		Inquiry inquiry = ordersService.selectInquiry(inquirynum);
		request.setAttribute("inquiry", inquiry);
		return "shopping/cons/production/inquiryDetail";
	}

	@RequestMapping("dfsfsdfsd4.do")
	public String dfsfsdfsd4() {
		return "shopping/cons/production/test";
	}

	@ResponseBody
	@RequestMapping(value = "fileuptest4.do", method = RequestMethod.POST)
	public int multiImageUpload(@RequestParam("files") List<MultipartFile> images, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("파일 업로드 실행");
		long sizeSum = 0;
		for (MultipartFile image : images) {
			String originalName = image.getOriginalFilename();
			// 확장자 검사
			if (!isValidExtension(originalName)) {
				return -1;
			}

			// 용량 검사
			sizeSum += image.getSize();
			if (sizeSum >= 10 * 1024 * 1024) {
				return -2;
			}

			// TODO 저장..
			int i = 0;
			MultipartFile files = image;
			System.out.println("name     " + originalName);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS" + i);
			String reName1 = sdf1.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originalName.substring(originalName.lastIndexOf(".") + 1);
			files.transferTo(
					new File(request.getSession().getServletContext().getRealPath("resources/img/goodsreviewpic") + "\\"
							+ reName1));
			logger.info("상품 사진 등록 성공 : " + originalName);

			i++;
		}

		// 실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
		// 특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
		return 1;
	}

	// required above jdk 1.7 - switch(String)
	private boolean isValidExtension(String originalName) {
		String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
		switch (originalNameExtension) {
		case "jpg":
		case "png":
		case "gif":
			return true;
		}
		return false;
	}
}
