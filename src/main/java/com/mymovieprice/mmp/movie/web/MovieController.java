package com.mymovieprice.mmp.movie.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.movie.service.MovieService;
import com.mymovieprice.mmp.util.StringUtils;


/**
 * <pre>
 * 클래스명 : com.mymovieprice.mmp.movie.web.MovieController.java
 * 기능요약 : 영화정보 처리용 Controller
 * 생성일 : 2016. 03. 11.
 * </pre>
 */

@Controller
public class MovieController {
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Resource(name="movieService")
    private MovieService movieService;
		
	@RequestMapping(value = "/admin/movie/movieList", method = RequestMethod.GET)
	public ModelAndView adminMovieList(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_list");
		List<Map<String, Object>> list;
		
		try {
			list = movieService.getMovieList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/createMovie", method = RequestMethod.GET)
	public ModelAndView adminMovieAdd(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_create");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/movieSave")
	@ResponseBody
	public Map<String, Object> adminMovieSave(Map<String,Object> condition, HttpServletRequest request) {
		
		String endYn = StringUtils.nvl(request.getParameter("endYn"), "N") ;
		String displayYn = StringUtils.nvl(request.getParameter("displayYn"),"N");
		
		//TODO WorkerIdv Session 처리
		String WorkerId = "SYSTEM";
		
		MovieCondition movieCondition = new MovieCondition();
			
		movieCondition.setMovieKorTitle(request.getParameter("movieTitle"));
		movieCondition.setMovieEngTitle(request.getParameter("movieEngTitle"));
		movieCondition.setReleaseDate(request.getParameter("releaseDate"));
		movieCondition.setEndYn(endYn);
		movieCondition.setDisplayYn(displayYn);
		movieCondition.setCreId(WorkerId);
		movieCondition.setUpdId(WorkerId);
		
		logger.info("movieKorTitle : "+movieCondition.getMovieKorTitle());
		logger.info("movieEngTitle : "+movieCondition.getMovieEngTitle());
		logger.info("releaseDate : "+movieCondition.getReleaseDate());
		logger.info("endYn : "+endYn);
		logger.info("displayYn : "+displayYn);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = movieService.addMovieMaster(movieCondition);
			logger.debug("result Count : "+map.get("resultCnt"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("error",e.getMessage());
			map.put("message","영화정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/movie/movieList", method = RequestMethod.GET)
	public ModelAndView movieList(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("movie/movie_list");
		List<Map<String, Object>> list;
		
		try {
			//list = movieService.getMovieList(condition);
			list = null;
			mav.addObject("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/movie/movieDetail", method = RequestMethod.GET)
	public ModelAndView movieDetail(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("movie/movie_detail");
		
		return mav;
	}

}
