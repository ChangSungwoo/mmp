package com.mymovieprice.mmp.main.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.common.web.MMPExceptionHandler;
import com.mymovieprice.mmp.main.service.MainService;
import com.mymovieprice.mmp.movie.service.MovieService;


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
	
	@Resource(name="mainService")
    private MainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("main/main");
		List<Map<String, Object>> list;
		
		try {
			list = mainService.getMainContentList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("영화 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieList");
			
		}
		
		return mav;
	}

}
