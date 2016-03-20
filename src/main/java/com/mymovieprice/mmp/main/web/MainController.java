package com.mymovieprice.mmp.main.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * <pre>
 * 클래스명 : com.mymovieprice.mmp.main.web.MainController.java
 * 기능요약 : MyMoviePrice Main Page용 Controller
 * 생성일 : 2016. 03. 08.
 * </pre>
 */

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView test(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("main/main");
		
		return mav;
	}

}
