package com.c4.intepark.shop.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.c4.intepark.constructors.model.vo.Constructors;
import com.c4.intepark.shop.Paging;
import com.c4.intepark.shop.goods.model.service.GoodsService;
import com.c4.intepark.shop.goods.model.vo.Goods;
import com.c4.intepark.shop.goods.model.vo.GoodsPic;
import com.c4.intepark.shop.goods.model.vo.GoodsReview;
import com.c4.intepark.shop.goods.model.vo.GoodsSearch;
import com.c4.intepark.shop.goods.model.vo.Inquiry;

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
		int r = ran.nextInt(goodsService.selectcategoryAllListCount() - 9) + 1;
		p.setStartRow(r);
		p.setEndRow(r + 8);
		ArrayList<Goods> list = goodsService.selectshopMainGoods(p);
		request.setAttribute("list", list);
		return "shopping/index";
	}

	// 상품 상세 조회
	@RequestMapping("moveproduct4.do")
	public String moveproduct(HttpServletRequest request,
			@RequestParam(name = "goodsnum", required = false) int goodsnum, GoodsSearch goodsSearch) {
		logger.info("상품 디테일 : " + goodsnum);
		// 상품조회
		Goods goods = goodsService.selectGoods(goodsnum);
		// 상품 사진 조회
		ArrayList<GoodsPic> list = goodsService.selectGoodsPic(goodsnum);
		// 리뷰 페이징 & 조회
		Paging p = new Paging(goodsService.selectgoodsReviewAllListCount(goodsnum));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		goodsSearch.setStartRow(p.getStartRow());
		goodsSearch.setEndRow(p.getEndRow());
		goodsSearch.setGoodsnum(goodsnum);
		ArrayList<GoodsReview> goodsreview = goodsService.selectGoodsReview(goodsSearch);
		Paging p1 = new Paging(goodsService.selectgoodsInquiryAllListCount(goodsnum));
		if (request.getParameter("page1") != null) {
			p1.setCurrentPage(Integer.parseInt(request.getParameter("page1")));
		}
		goodsSearch.setStartRow(p1.getStartRow());
		goodsSearch.setEndRow(p1.getEndRow());
		goodsSearch.setGoodsnum(goodsnum);
		ArrayList<Inquiry> goodsInquiry = goodsService.selectGoodsInquiry(goodsSearch);
		// float reviewscore = Math.round(goodsService.selectreviewscore(goodsnum));

		request.setAttribute("maxPage1", p1.getMaxPage());
		request.setAttribute("currentPage1", p1.getCurrentPage());
		request.setAttribute("beginPage1", p1.getBeginPage());
		request.setAttribute("endPage1", p1.getEndPage());

		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		request.setAttribute("goods", goods);
		request.setAttribute("goodsreview", goodsreview);
		request.setAttribute("goodsInquiry", goodsInquiry);
		request.setAttribute("list", list);
		// request.setAttribute("reviewscore", reviewscore);
		return "shopping/product-details";
	}

	@RequestMapping("moveshopcategory4.do")
	public String moveshopcategory(HttpServletRequest request) {
		logger.info("샵 카테고리 접속 ");
		Paging p = new Paging(goodsService.selectcategoryAllListCount());
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		ArrayList<Goods> list = goodsService.selectcategoryGoodsAllList(p);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		return "shopping/shop";
	}

	@RequestMapping("movegoodsinsert.do")
	public String movegoodsinsert() {
		return "shopping/cons/production/plain";
	}

	// 상품 등록
	@RequestMapping(value = "goodsinsert4.do", method = RequestMethod.POST)
	public void goodsinsert(Model model, Goods goods, @SessionAttribute("loginCons") Constructors cons,
			MultipartHttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		MultipartFile file = request.getFile("file");
		String oriName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String reName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ oriName.substring(oriName.lastIndexOf(".") + 1);
		goods.setThumbnail(reName);
		goods.setConsid(cons.getConsid());
		logger.info("상품등록 실행 : " + goods);
		try {
			int result = goodsService.insertGoods(goods);
			if (result <= 0) {
				model.addAttribute("message", "상품 등록에 실패하였습니다.");
				//return "common/error";
			}
			file.transferTo(new File(request.getSession().getServletContext().getRealPath("resources/img/goodthumspic")
					+ "\\" + reName));
		} catch (Exception e) {
			e.printStackTrace();
		}

		for (int i = 1; i <= 4; i++) {
			MultipartFile files = request.getFile("file" + i);
			String oriName1 = files.getOriginalFilename();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS" + i);
			String reName1 = sdf1.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ oriName1.substring(oriName1.lastIndexOf(".") + 1);
			GoodsPic gp = new GoodsPic();
			gp.setOrifile(oriName1);
			gp.setRefile(reName1);
			gp.setGoodsnum(goodsService.selectGoodsNum(goods));
			gp.setPicnum(i);
			int result = goodsService.insertGoodsPic(gp);
			files.transferTo(
					new File(request.getSession().getServletContext().getRealPath("resources/img/goodsdetailpic") + "\\"
							+ reName1));
			logger.info("상품 사진 등록 성공 : " + oriName1);
		}
		
		  response.setContentType("text/html; charset=utf-8"); PrintWriter out =
		  response.getWriter(); out.println("<script>");
		  out.println("alert('상품 등록 성공!');");
		 out.println("window.location = 'movegoodslist4.do';");
		  out.println("</script>");
		 
		//return "shopping/cons/production/goodsinsert";
	}

	@RequestMapping(value = "goodsinsert41.do", method = RequestMethod.POST)
	public String goodsinsert1(@RequestParam(name = "file", required = false) MultipartFile file,
			HttpServletRequest request, GoodsPic goodspic, Model model) {
		logger.info(file.getOriginalFilename());

		return null;
	}

	// 상품 목록 조회 & 페이징 처리
	@RequestMapping("movegoodslist4.do")
	public String movegoodslist4(@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request,
			GoodsSearch goodssearch) {
		logger.info("상품 목록 조회 : " + cons);
		/*
		 * String consid = cons.getConsid(); Paging p = new
		 * Paging(goodsService.selectlistCount(consid)); if
		 * (request.getParameter("page") != null) {
		 * p.setCurrentPage(Integer.parseInt(request.getParameter("page"))); }
		 * goodssearch.setStartRow(p.getStartRow());
		 * goodssearch.setEndRow(p.getEndRow()); goodssearch.setConsid(consid);
		 * 
		 * ArrayList<Goods> list = goodsService.selectgoodsList(goodssearch);
		 * request.setAttribute("list", list); request.setAttribute("maxPage",
		 * p.getMaxPage()); request.setAttribute("currentPage", p.getCurrentPage());
		 * request.setAttribute("beginPage", p.getBeginPage());
		 * request.setAttribute("endPage", p.getEndPage());
		 */
		ArrayList<Goods> list = goodsService.selectgoodsList(cons.getConsid());
		request.setAttribute("list", list);
		return "shopping/cons/production/goodslist2";
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
	public String consgoodssearch4(@RequestParam(name = "goodsname") String goodsname,
			@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request, GoodsSearch goodsSearch) {
		logger.info("상품 목록 검색 : " + cons);
		String consid = cons.getConsid();
		goodsname = "%" + goodsname + "%";
		goodsSearch.setConsid(consid);
		goodsSearch.setGoodsname(goodsname);
		Paging p = new Paging(goodsService.selectsearchlistCount(goodsSearch));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		goodsSearch.setStartRow(p.getStartRow());
		goodsSearch.setEndRow(p.getEndRow());
		goodsSearch.setConsid(consid);
		ArrayList<Goods> list = goodsService.selectgoodsSearchList(goodsSearch);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		request.setAttribute("goodsname", goodsname);
		return "shopping/cons/production/consgoodsSearchlist";
	}

	@RequestMapping("movereviewinsert4.do")
	public String movereviewinsert(HttpServletRequest request,
			@RequestParam(name = "goodsnum", required = false) int goodsnum) {
		logger.info("상품 리뷰창으로 이동 : " + goodsnum);
		Goods goods = goodsService.selectGoods(goodsnum);
		request.setAttribute("goods", goods);
		return "shopping/reviewinsert";
	}

	@RequestMapping("moveinquiryinsert4.do")
	public String moveinquiryinsert4(HttpServletRequest request,
			@RequestParam(name = "goodsnum", required = false) int goodsnum) {
		logger.info("상품 문의창으로 이동 : " + goodsnum);
		Goods goods = goodsService.selectGoods(goodsnum);
		request.setAttribute("goods", goods);
		return "shopping/inquiryinsert";
	}

	@RequestMapping("moveshopcategorysub4.do")
	public String moveshopcategorysub(HttpServletRequest request,
			@RequestParam(name = "categorynum", required = false) int categorynum, GoodsSearch goodsSearch) {
		logger.info("샵 서브 카테고리 접속 ");
		Paging p = new Paging(goodsService.selectcategoryListCount(categorynum));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		goodsSearch.setStartRow(p.getStartRow());
		goodsSearch.setEndRow(p.getEndRow());
		goodsSearch.setGoodsnum(categorynum);
		ArrayList<Goods> list = goodsService.selectcategoryGoodsList(goodsSearch);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		request.setAttribute("categorynum", categorynum);
		return "shopping/shop2";
	}

	public static int reviewNum = 0;
	public static String reviewThum = "null";

	@ResponseBody
	@RequestMapping(value = "goodsreviewimgup4.do", method = RequestMethod.POST)
	public int multiImageUpload(@RequestParam("files") List<MultipartFile> images, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("파일 업로드 실행");
		long sizeSum = 0;
		int i = 0;
		reviewThum = "null";
		reviewNum = goodsService.selectGoodsReviewNum();
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
			MultipartFile files = image;
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS" + i);
			String reName1 = sdf1.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originalName.substring(originalName.lastIndexOf(".") + 1);
			files.transferTo(
					new File(request.getSession().getServletContext().getRealPath("resources/img/goodsreviewpic") + "\\"
							+ reName1));
			GoodsPic gp = new GoodsPic();
			gp.setRefile(reName1);
			gp.setGoodsnum(reviewNum);
			int result = goodsService.insertReviewPic(gp);
			++i;
			reviewThum = reName1;
		}

		// 실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
		// 특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
		return 1;
	}

	public static int inquiryNum = 0;

	@ResponseBody
	@RequestMapping(value = "goodsInquiryimgup4.do", method = RequestMethod.POST)
	public int goodsInquiryimgup4(@RequestParam("files") List<MultipartFile> images, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("파일 업로드 실행");
		long sizeSum = 0;
		int i = 0;
		inquiryNum = goodsService.selectGoodsInquiryNum();
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
			MultipartFile files = image;
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS" + i);
			String reName1 = sdf1.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originalName.substring(originalName.lastIndexOf(".") + 1);
			files.transferTo(
					new File(request.getSession().getServletContext().getRealPath("resources/img/goodsinquirypic")
							+ "\\" + reName1));
			GoodsPic gp = new GoodsPic();
			gp.setRefile(reName1);
			gp.setGoodsnum(inquiryNum);
			int result = goodsService.insertInquiryPic(gp);
			++i;
		}

		// 실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
		// 특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
		return 1;
	}

	@RequestMapping(value = "goodsinquiryInsert4.do", method = RequestMethod.POST)
	public String goodsinquiryInsert(Inquiry goodsinquiry, HttpServletRequest request) {
		goodsinquiry.setInquirynum(inquiryNum);
		int result = goodsService.insertGoodsInquiry(goodsinquiry);
		logger.info("리뷰 작성 완료 : " + result);
		return "redirect:moveproduct4.do?goodsnum=" + goodsinquiry.getGoodsnum();
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

	@RequestMapping(value = "goodsReviewInsert4.do", method = RequestMethod.POST)
	public String goodsReviewInsert(GoodsReview goodsreview, HttpServletRequest request) {
		goodsreview.setReviewnum(reviewNum);
		goodsreview.setRefile(reviewThum);
		int result = goodsService.insertGoodsReview(goodsreview);
		logger.info("리뷰 작성 완료 : " + result);
		return "redirect:moveproduct4.do?goodsnum=" + goodsreview.getGoodsnum();
	}

	@RequestMapping("goodsReviewDetail4.do")
	public String goodsReviewDetail(@RequestParam("reviewnum") int reviewnum, @RequestParam("goodsnum") int goodsnum,
			HttpServletRequest request) {
		GoodsReview review = goodsService.selectGoodsReviewDetail(reviewnum);
		ArrayList<GoodsReview> list = goodsService.selectGoodsReviewDetailPic(reviewnum);
		Goods goods = goodsService.selectGoods(goodsnum);
		request.setAttribute("goods", goods);
		request.setAttribute("review", review);
		request.setAttribute("list", list);
		return "shopping/goodsReviewDetail";
	}

	@RequestMapping("goodsInquiryDetail4.do")
	public String goodsInquiryDetail(@RequestParam("inquirynum") int inquirynum, @RequestParam("goodsnum") int goodsnum,
			HttpServletRequest request) {
		Inquiry inquiry = goodsService.selectGoodsInquiryDetail(inquirynum);
		Inquiry inquiryanswer = goodsService.selectGoodsInquiryAnswer(inquirynum);
		ArrayList<Inquiry> list = goodsService.selectGoodsInquiryDetailPic(inquirynum);
		Goods goods = goodsService.selectGoods(goodsnum);
		request.setAttribute("goods", goods);
		request.setAttribute("inquiry", inquiry);
		request.setAttribute("inquiryanswer", inquiryanswer);
		request.setAttribute("list", list);
		return "shopping/goodsInquiryDetail";
	}

	@RequestMapping("goodsInquiryDelete4.do")
	public void goodsInquiryDelete4(@RequestParam("inquirynum") int inquirynum, @RequestParam("goodsnum") int goodsnum,
			HttpServletResponse response) throws IOException {
		logger.info("문의 삭제 : " + inquirynum);
		int result = goodsService.deleteInquiry(inquirynum);
		int result2 = goodsService.deleteInquiryPic(inquirynum);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');");
			out.println("location.href = 'moveproduct4.do?goodsnum=" + goodsnum + "';</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}

	@RequestMapping("goodsReviewDelete4.do")
	public void goodsReviewDelete4(@RequestParam("reviewnum") int reviewnum, @RequestParam("goodsnum") int goodsnum,
			HttpServletResponse response) throws IOException {
		logger.info("문의 삭제 : " + reviewnum);
		int result = goodsService.deleteReview(reviewnum);
		int result2 = goodsService.deleteReviewPic(reviewnum);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제 성공!');");
			out.println("location.href = 'moveproduct4.do?goodsnum=" + goodsnum + "';</script>");
		} else {
			out.println("<script>alert('삭제 실패!');</script>");
		}
	}

	@RequestMapping("ddfdf.do")
	public String ddfdf(@SessionAttribute("loginCons") Constructors cons, HttpServletRequest request,
			GoodsSearch goodssearch) {
		logger.info("상품 목록 조회 : " + cons);
		String consid = cons.getConsid();
		Paging p = new Paging(goodsService.selectlistCount(consid));
		if (request.getParameter("page") != null) {
			p.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		goodssearch.setStartRow(p.getStartRow());
		goodssearch.setEndRow(p.getEndRow());
		goodssearch.setConsid(consid);

		ArrayList<Goods> list = goodsService.selectgoodsList(goodssearch);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", p.getMaxPage());
		request.setAttribute("currentPage", p.getCurrentPage());
		request.setAttribute("beginPage", p.getBeginPage());
		request.setAttribute("endPage", p.getEndPage());
		return "shopping/cons/production/test";
	}
	
	@RequestMapping("moveinquiryDetail4.do")
	public String moveinquiryDetail(@RequestParam("inquirynum") int inquirynum, HttpServletRequest request) {
		logger.info("상품 문의 상세 조회" + inquirynum);
		Inquiry inquiry = goodsService.selectGoodsInquiryDetail(inquirynum);
		ArrayList<Inquiry> list = goodsService.selectGoodsInquiryDetailPic(inquirynum);
		Goods goods = goodsService.selectGoods(inquiry.getGoodsnum());
		request.setAttribute("goods", goods);
		request.setAttribute("inquiry", inquiry);
		request.setAttribute("list", list);
		return "shopping/cons/production/inquiryDetail";
	}
	
	@RequestMapping(value = "goodsAnswerInsert4.do", method = RequestMethod.POST)
	public String goodsReviewInsert(Inquiry inquiry, HttpServletRequest request) {
		int result = goodsService.insertGoodsAnswer(inquiry);
		int result1 = goodsService.updateGoodsAnswer(inquiry.getInquirynum());
		logger.info("문의 답변 완료 : " + result);
		return "redirect:moveconsInquiryList4.do";
	}
}
