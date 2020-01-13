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
	
	@RequestMapping("temple49.do")
	public String temple9() {
		return "TemplateFolder/form_advanced";
	}
	
	@RequestMapping("temple441.do")
	public String temple441() {
		return "TemplateFolder/form_buttons";
	}
	
	@RequestMapping("temple442.do")
	public String temple442() {
		return "TemplateFolder/form_upload";
	}
	
	@RequestMapping("temple443.do")
	public String temple443() {
		return "TemplateFolder/form_validation";
	}
	
	@RequestMapping("temple444.do")
	public String temple444() {
		return "TemplateFolder/form_wizards";
	}
	
	@RequestMapping("temple445.do")
	public String temple445() {
		return "TemplateFolder/form";
	}
	
	@RequestMapping("temple446.do")
	public String temple446() {
		return "TemplateFolder/general_elements";
	}
	
	@RequestMapping("temple447.do")
	public String temple447() {
		return "TemplateFolder/inbox";
	}
	
	@RequestMapping("temple448.do")
	public String temple448() {
		return "TemplateFolder/tables_dynamic";
	}
	
	@RequestMapping("temple449.do")
	public String temple449() {
		return "TemplateFolder/tables";
	}

	

}
