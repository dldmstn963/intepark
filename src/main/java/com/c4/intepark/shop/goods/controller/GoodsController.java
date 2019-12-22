package com.c4.intepark.shop.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.service.GoodsService;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;
import com.c4.intepark.shop.goodsreview.model.vo.GoodsReview;

@Controller
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);

	public GoodsController() {
	}

	@Autowired
	private GoodsService goodsService;

	@RequestMapping("movegoodsinsert4.do")
	public String movegoodsinsert4() {
		return "shopping/cons/production/goodsinsert";
	}
	
	@RequestMapping("moveconsshop4.do")
	public String cons() {
		return "shopping/cons/production/index";
	}
	
	@RequestMapping("moveshop4.do")
	public String moveshop(HttpServletRequest request) {
		logger.info("쇼핑몰 메인 페이지 ");
		Random ran = new Random();
		Paging p = new Paging();
		int r = ran.nextInt(goodsService.categoryAllListCount()-9)+1;
		p.setStartRow(r);
		p.setEndRow(r+8);
		ArrayList<Goods> list = goodsService.shopMainGoods(p);
		request.setAttribute("list", list);
		return "shopping/index";
	}
	
	@RequestMapping("moveproduct4.do")
	public String moveproduct(HttpServletRequest request,
			@RequestParam(name = "goodsnum", required = false)int goodsnum,
			GoodsSearch goodsSearch) {
		logger.info("상품 디테일 : " + goodsnum);
		Goods goods = goodsService.selectGoods(goodsnum);
		ArrayList<GoodsPic> list = goodsService.selectGoodsPic(goodsnum);
		Paging p = new Paging(goodsService.goodsReviewAllListCount(goodsnum));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		goodsSearch.setStartRow(p.getStartRow());
		goodsSearch.setEndRow(p.getEndRow());
		goodsSearch.setGoodsnum(goodsnum);
		ArrayList<GoodsReview> goodsreview = goodsService.selectGoodsReview(goodsSearch);
		request.setAttribute("goods", goods);
		request.setAttribute("goodsreview", goodsreview);
		request.setAttribute("list", list);
		System.out.println(goodsreview.indexOf(0));
		return "shopping/product-details";
	}
	
	@RequestMapping("moveshopcategory4.do")
	public String moveshopcategory(HttpServletRequest request) {
		logger.info("샵 카테고리 접속 ");
		Paging p = new Paging(goodsService.categoryAllListCount());
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		ArrayList<Goods> list = goodsService.categoryGoodsAllList(p);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		return "shopping/shop";
	}
	
	@RequestMapping("moveshbasket4.do")
	public String moveshbasket() {
		return "shopping/cart";
	}

	@RequestMapping("movegoodsinsert.do")
	public String movegoodsinsert() {
		return "shopping/cons/production/plain";
	}
	// 상품 등록
	@RequestMapping(value = "goodsinsert4.do", method = RequestMethod.POST)
	public String goodsinsert(Model model, Goods goods,
			 MultipartHttpServletRequest request ) throws IllegalStateException, IOException {
		MultipartFile file = request.getFile("file");
		String oriName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String reName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ oriName.substring(oriName.lastIndexOf(".") + 1);
		goods.setThumbnail(reName);
		logger.info("상품등록 실행 : " + goods);
		try {
			int result = goodsService.insertGoods(goods);
			if (result <= 0) {
				model.addAttribute("message", "상품 등록에 실패하였습니다.");
				return "common/error";
			}
			file.transferTo(new File(request.getSession().getServletContext().getRealPath("resources/img/goodthumspic") + "\\" + reName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		for(int i = 1; i <= 4; i++) {
			MultipartFile files = request.getFile("file"+i);
			String oriName1 = files.getOriginalFilename();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS"+i);
			String reName1 = sdf1.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ oriName1.substring(oriName1.lastIndexOf(".") + 1);
			GoodsPic gp = new GoodsPic();
			gp.setOrifile(oriName1);
			gp.setRefile(reName1);
			gp.setGoodsnum(goodsService.selectGoodsNum(goods));
			gp.setPicnum(i);
			int result = goodsService.insertGoodsPic(gp);
			files.transferTo(new File(request.getSession().getServletContext().getRealPath("resources/img/goodsdetailpic") + "\\" + reName1));
			logger.info("상품 사진 등록 성공 : " + oriName1);
		}
		
		return "shopping/cons/production/goodsinsert";
	}
	
	@RequestMapping(value = "goodsinsert41.do", method = RequestMethod.POST)
	public String goodsinsert1(@RequestParam(name = "file", required = false) MultipartFile file, HttpServletRequest request, GoodsPic goodspic,Model model) {
		logger.info(file.getOriginalFilename());
		
		
		return null;
	}

	// 상품 목록 조회 & 페이징 처리
	@RequestMapping("movegoodslist4.do")
	public String movegoodslist4(@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request,
			GoodsList goodslist) {
		logger.info("상품 목록 조회 : " + cons);
		String consid = cons.getConsid();
		Paging p = new Paging(goodsService.listCount(consid));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		goodslist.setStartRow(p.getStartRow());
		goodslist.setEndRow(p.getEndRow());
		goodslist.setConsid(consid);
		ArrayList<Goods> list = goodsService.goodsList(goodslist);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		return "shopping/cons/production/goodslist";
	}

	
	// 상품 테이블 행 안에 있는 삭제 버튼
	@RequestMapping(value = "goodsdelete4.do", method = RequestMethod.POST)
	public void goodsdelete4(@RequestParam("goodsnum") int goodsnum, HttpServletResponse response) throws IOException {
		logger.info("상품 삭제 : " + goodsnum);
		int result = goodsService.deleteGoods(goodsnum);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}

	// 상품 수정페이지 이동
	@RequestMapping("moveupdategoods4.do")
	public String moveupdategoods4(@RequestParam("goodsnum") int goodsnum, HttpServletRequest request) {
		logger.info("상품 수정 페이지 이동: " + goodsnum);
		Goods goods = goodsService.selectGoods(goodsnum);
		request.setAttribute("goods", goods);
		return "shopping/cons/production/goodsupdate";
	}
	
	
	
	// 상품 수정
	@RequestMapping(value = "goodsupdate4.do", method = RequestMethod.POST)
	public String goodsupdate4(Goods goods, @RequestParam(name = "file", required = false) MultipartFile file,
			HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/img/goodthumspic");
		new File(savePath + "\\" + goods.getThumbnail()).delete();
		String oriName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String reName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ oriName.substring(oriName.lastIndexOf(".") + 1);
		goods.setThumbnail(reName);
		logger.info("상품 수정 : " + goods);
		try {
			int result = goodsService.updateGoods(goods);
			file.transferTo(new File(savePath + "\\" + reName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:movegoodslist4.do";
	}
	
	// 상품 검색
		@RequestMapping("consgoodssearch4.do")
		public String consgoodssearch4(@RequestParam(name="goodsname")String goodsname,@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request,
				GoodsSearch goodsSearch) {
			logger.info("상품 목록 검색 : " + cons);
			String consid = cons.getConsid();
			goodsSearch.setConsid(consid);
			goodsSearch.setGoodsname(goodsname);
			Paging p = new Paging(goodsService.searchlistCount(goodsSearch));
			if (request.getParameter("page") != null) {
				p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
			}
			goodsSearch.setStartRow(p.getStartRow());
			goodsSearch.setEndRow(p.getEndRow());
			goodsSearch.setConsid(consid);
			ArrayList<Goods> list = goodsService.goodsSearchList(goodsSearch);
			request.setAttribute("list", list);
			request.setAttribute("maxPage", p.getMaxPage());
			request.setAttribute("currentPage", p.getCurrentPage());
			request.setAttribute("beginPage", p.getBeginPage());
			request.setAttribute("endPage", p.getEndPage());
			request.setAttribute("goodsname", goodsname);
			return "shopping/cons/production/consgoodsSearchlist";
		}
		
		 
}
