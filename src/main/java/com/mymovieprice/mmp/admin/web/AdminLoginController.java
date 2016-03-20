package com.mymovieprice.mmp.admin.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 * 클래스명 : com.mymovieprice.mmp.admin.web.AdminLoginController.java
 * 기능요약 : MyMoviePrice Admin용 Login Controller
 * 생성일 : 2016. 03. 10.
 * </pre>
 */

@Controller
public class AdminLoginController {
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@RequestMapping(value = "/admin/", method = RequestMethod.GET)
	public ModelAndView adminRoot(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/login");
		
		return mav;
	}

	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public ModelAndView test(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/login");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public ModelAndView adminMain(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/main");
		
		return mav;
	}
}
