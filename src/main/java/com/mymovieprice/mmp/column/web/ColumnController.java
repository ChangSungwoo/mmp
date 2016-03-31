package com.mymovieprice.mmp.column.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.main.web.MainController;

/**
 * <pre>
 * 클래스명 : com.mymovieprice.mmp.column.web.ColumnController.java
 * 기능요약 : MyMoviePrice 읽을거리 Page용 Controller
 * 생성일 : 2016. 03. 24.
 * </pre>
 */

@Controller
public class ColumnController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/column/columnList", method = RequestMethod.GET)
	public ModelAndView columnList(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("column/column_list");
		
		return mav;
	}
	
	@RequestMapping(value = "/column/columnDetail", method = RequestMethod.GET)
	public ModelAndView columnDetail(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("column/column_detail");
		
		return mav;
	}
	
}
