package com.c4.intepark;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("Welcome main!");
		return "main";

	}

	@RequestMapping("auctionList.do")
	public String auctionList() {
		return "auctionList";
	}

	@RequestMapping("login6.do")
	public String loginMember() {
		return "member/login";
	}

	@RequestMapping("temple4.do")
	public String temple() {
		return "TemplateFolder/templezip";
	}

	@RequestMapping("temple41.do")
	public String temple1() {
		return "TemplateFolder/about-us";
	}

	@RequestMapping("temple42.do")
	public String temple2() {
		return "TemplateFolder/agents";
	}

	@RequestMapping("temple43.do")
	public String temple3() {
		return "TemplateFolder/contact";
	}

	@RequestMapping("temple44.do")
	public String temple4() {
		return "TemplateFolder/elements";
	}

	@RequestMapping("temple46.do")
	public String temple6() {
		return "TemplateFolder/properties";
	}

	@RequestMapping("temple47.do")
	public String temple7() {
		return "TemplateFolder/single-blog";
	}

	@RequestMapping("temple48.do")
	public String temple8() {
		return "TemplateFolder/blog";
	}

	@RequestMapping("moveshop4.do")
	public String moveshop() {
		return "shopping/index";
	}
	
	@RequestMapping("moveproduct4.do")
	public String moveproduct() {
		return "shopping/product-details";
	}
	
	@RequestMapping("moveshopcategory4.do")
	public String moveshopcategory() {
		return "shopping/shop";
	}
	
	@RequestMapping("moveshbasket4.do")
	public String moveshbasket() {
		return "shopping/cart";
	}

}
