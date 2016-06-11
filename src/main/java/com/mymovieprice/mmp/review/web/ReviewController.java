package com.mymovieprice.mmp.review.web;

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
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.movie.model.MovieMaster;
import com.mymovieprice.mmp.movie.model.MoviePriceCondition;
import com.mymovieprice.mmp.review.model.MovieReview;
import com.mymovieprice.mmp.movie.service.MovieService;
import com.mymovieprice.mmp.review.service.ReviewService;

@Controller
public class ReviewController {
	
private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Resource(name="reviewService")
    private ReviewService reviewService;
	
	@Resource(name="movieService")
    private MovieService movieService;

	
	@RequestMapping(value = "/review/reviewListByEditor", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView movieList(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("review/review_list_editor");
		List<Map<String, Object>> list;
		
		try {
			//list = movieService.getMovieListByEditor(condition);
			list = reviewService.getReviewListByEditor(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","200", "/movie/movieList");
		}
		
		return mav;
	}	
	
	@RequestMapping(value = "/review/reviewDetail", method = RequestMethod.GET)
	public ModelAndView movieDetail(Map<String,Object> condition, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("review/review_detail");
		MovieMaster movieInfo = new MovieMaster();
		MovieReview reviewInfo = new MovieReview();
		
		List<Map<String, Object>> list;
		
		String movieID = null;
		String reviewSeq = null;
		
		List<Map<String, Object>> pList;
		List<Map<String, Object>> nList;
		
		reviewSeq = request.getParameter("reviewSeq");
		
		condition.put("reviewSeq", reviewSeq);
		
		try {
			
			reviewInfo = reviewService.getReviewDetail(condition);
			movieID = reviewInfo.getMovieId();
			condition.put("movieId", movieID);
			
			pList = getOneMoviePriceList(movieID , "P");
			nList= getOneMoviePriceList(movieID , "N");
			
			movieInfo = movieService.getMovieInfo(condition);
			logger.info("MovieInfo Title : "+movieInfo.getMovieKorTitle());
			
			list = movieService.getOneMovieImageList(condition);
			logger.info("ImageList Size : "+list.size());
			
			//list = null;
			//movieInfo = null;
			mav.addObject("list", list);
			mav.addObject("pList", pList);
			mav.addObject("nList", nList);
			mav.addObject("movie", movieInfo);
			mav.addObject("review", reviewInfo);
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/moviePriceList", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMoviePriceList(Map<String,Object> condition) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_price_list");
		List<Map<String, Object>> list;
		
		try {
			list = movieService.getMoviePriceList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
			
		}
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/moviePriceDetail", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMoviePriceDetail(Map<String,Object> condition, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_price_detail");
		MovieMaster movieInfo = new MovieMaster();
		MovieReview reviewInfo = new MovieReview();
		String movieID = null;
		String reviewSeq = null;
		
		List<Map<String, Object>> pList;
		List<Map<String, Object>> nList;
		List<Map<String, Object>> iList;
		
		movieID = request.getParameter("movieId");
		reviewSeq = request.getParameter("reviewSeq");
		condition.put("movieId", movieID);
		condition.put("reviewSeq", reviewSeq);
		
		pList = getOneMoviePriceList(movieID , "P");
		nList= getOneMoviePriceList(movieID , "N");
		
		try {
			movieInfo = movieService.getMovieInfo(condition);
			reviewInfo = reviewService.getReviewDetail(condition);
			iList = movieService.getOneMovieImageList(condition);
			
			mav.addObject("movie", movieInfo);
			mav.addObject("review", reviewInfo);
			mav.addObject("pList", pList);
			mav.addObject("nList", nList);
			mav.addObject("iList", iList);
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
		}
		
		return mav;
	}
	
	public List<Map<String, Object>> getOneMoviePriceList(String strReviewSeq , String strPriceDiv) {
		
		MoviePriceCondition moviePriceCondition = new MoviePriceCondition();
		List<Map<String, Object>> list = null;
			
		moviePriceCondition.setReviewSeq(strReviewSeq);
		moviePriceCondition.setPriceDiv(strPriceDiv);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			list = movieService.getOneMoviePriceList(moviePriceCondition);
			//list = null;

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","적정 관람료 정보 조회에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return list;
	}
	
}
