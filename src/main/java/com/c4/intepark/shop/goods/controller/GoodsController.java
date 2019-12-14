package com.c4.intepark.shop.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.shop.goods.model.service.GoodsService;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsList;

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

	// 상품 등록
	@RequestMapping(value = "goodsinsert4.do", method = RequestMethod.POST)
	public String goodsinsert(Model model, Goods goods,
			@RequestParam(name = "file", required = false) MultipartFile file, HttpServletRequest request) {
		String oriName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String reName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ oriName.substring(oriName.lastIndexOf(".") + 1);
		goods.setThumbnail(reName);
		String savePath = request.getSession().getServletContext().getRealPath("resources/img/goodthumspic");
		logger.info("상품등록 실행 : " + goods);
		try {
			int result = goodsService.insertGoods(goods);
			if (result <= 0) {
				model.addAttribute("message", "상품 등록에 실패하였습니다.");
				return "common/error";
			}
			file.transferTo(new File(savePath + "\\" + reName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "shopping/cons/production/goodsinsert";
	}

	// 상품 목록 조회 & 페이징 처리
	@RequestMapping("movegoodslist4.do")
	public String movegoodslist4(@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request,
			GoodsList goodslist) {
		logger.info("상품 목록 조회 : " + cons);
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		String consid = cons.getConsid();
		int limit = 10;
		int listCount = goodsService.listCount(consid);
		int maxPage = listCount / limit;
		if (listCount % limit > 0) {
			maxPage++;
		}
		int beginPage = 0;
		if (currentPage % limit == 0) {
			beginPage = currentPage - 9;
		} else {
			beginPage = (currentPage / limit) * limit + 1;
		}
		int endPage = beginPage + 9;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		int startRow = (currentPage * limit) - 9;
		int endRow = currentPage * limit;
		goodslist.setStartRow(startRow);
		goodslist.setEndRow(endRow);
		goodslist.setConsid(consid);
		ArrayList<Goods> list = goodsService.goodsList(goodslist);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
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
		return "shopping/cons/production/goodsinsert";
	}

}
