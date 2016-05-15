package com.mymovieprice.mmp.common.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.main.web.MainController;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	
	@RequestMapping(value = "/admin/common/adminErr", method = RequestMethod.GET)
	public ModelAndView adminError(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/common/admin_error");
		
		return mav;
	}
	
	@RequestMapping(value = "/common/header", method = RequestMethod.GET)
	public ModelAndView frontHeader(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/include/header");
		
		HttpSession session = request.getSession(false);
		
		logger.info("controller check : "+session.getAttribute("member"));
		mav.addObject("loginInfo" , session.getAttribute("member"));
		
		
		return mav;
	}	
}
