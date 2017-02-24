package com.mymovieprice.mmp.review.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.movie.model.MovieImage;
import com.mymovieprice.mmp.movie.model.MovieMaster;
import com.mymovieprice.mmp.review.model.MoviePriceCondition;
import com.mymovieprice.mmp.review.model.MovieReviewCondition;
import com.mymovieprice.mmp.review.model.ReviewRecommCondition;
import com.mymovieprice.mmp.review.model.MovieReview;
import com.mymovieprice.mmp.movie.service.MovieService;
import com.mymovieprice.mmp.review.service.ReviewService;
import com.mymovieprice.mmp.util.StringUtils;

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
		List<Map<String, Object>> userList;
		
		try {
			list = reviewService.getReviewListByEditor(condition);
			userList = reviewService.getReviewListByUser(condition);
			
			mav.addObject("list", list);
			mav.addObject("uList", userList);
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","200", "/movie/movieList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/review/reviewListByUser", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView movieListByUser(Map<String,Object> condition, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("review/review_list_user");
		List<Map<String, Object>> list;
		List<Map<String, Object>> userList;
		MovieMaster movieInfo = new MovieMaster();
		MovieImage movieImage = new MovieImage();
		
		String movieID = request.getParameter("movieId");
		condition.put("movieId", movieID);
		
		try {
			movieInfo = movieService.getMovieInfo(condition);
			movieImage = movieService.getDelegateImage(condition);
			
			list = reviewService.getReviewListByEditor(condition);
			userList = reviewService.getUserReviewListByMovie(condition);
			
			mav.addObject("movie", movieInfo);
			mav.addObject("image", movieImage);
			mav.addObject("list", list);
			mav.addObject("uList", userList);
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","200", "/movie/movieList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/review/oldReviewListByEditor", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView oldMovieList(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("review/review_list_editor");
		List<Map<String, Object>> list;
		List<Map<String, Object>> userList;
		
		try {
			list = reviewService.getOldReviewListByEditor(condition);
			userList = reviewService.getOldReviewListByUser(condition);
			
			mav.addObject("list", list);
			mav.addObject("uList", userList);
			
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
		
		condition.put("admin", "false");
		
		try {
			
			reviewInfo = reviewService.getReviewDetail(condition);
			movieID = reviewInfo.getMovieId();
			condition.put("movieId", movieID);
			
			pList = getOneMoviePriceList(reviewSeq , "P");
			nList= getOneMoviePriceList(reviewSeq , "N");
			
			movieInfo = movieService.getMovieInfo(condition);
			//logger.info("MovieInfo Title : "+movieInfo.getMovieKorTitle());
			
			list = movieService.getOneMovieImageList(condition);
			logger.info("ImageList Size : "+list.size());
			
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
	
	@RequestMapping(value = "/review/reviewRecomm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewRecommend(Map<String,Object> condition, HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		ReviewRecommCondition reviewRecommCondition = new ReviewRecommCondition();
		
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		logger.info("WorkerId : "+WorkerId);
		//TODO Login안하면 요게 없다..요기만 예외 처리할까?
		
		reviewRecommCondition.setReviewSeq(request.getParameter("reviewSeq"));
		reviewRecommCondition.setMovieId(request.getParameter("movieId"));
		reviewRecommCondition.setUserNo(request.getParameter("userNo"));
		reviewRecommCondition.setRecommUserNo(WorkerId);
		reviewRecommCondition.setRecommDiv(request.getParameter("recommDiv"));
		
		try {
			map = reviewService.addReviewRecomm(reviewRecommCondition);

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화 리뷰 정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		
		return map;
	}
	
	@RequestMapping(value = "/review/reviewWrite", method = RequestMethod.GET)
	public ModelAndView userReviewWrite(Map<String,Object> condition, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("review/review_write");
		List<Map<String, Object>> list;
		MovieReview reviewInfo = new MovieReview();
		list = null;
		
		List<Map<String, Object>> pList;
		List<Map<String, Object>> nList;
		
		pList = null;
		nList = null;
		
		String movieID = request.getParameter("movieId");
		String reviewSeq = request.getParameter("reviewSeq");
		
		condition.put("movieId", movieID);
		condition.put("reviewSeq", reviewSeq);
		
		try {
				list = movieService.getOneMovieImageList(condition);
				
				if(reviewSeq != null && reviewSeq != "") {
					logger.info("감상평 정보 가져옴...");
					reviewInfo = reviewService.getReviewDetail(condition);
					
					pList = getOneMoviePriceList(reviewSeq , "P");
					logger.info("pList Size : "+pList.size());
					
					nList= getOneMoviePriceList(reviewSeq , "N");
					logger.info("nList Size : "+nList.size());
				} else {
					logger.info("감상평 정보 가져오지 않음...");
					reviewInfo = null;
				}
			
				mav.addObject("list", list);
				mav.addObject("pList", pList);
				mav.addObject("nList", nList);
				mav.addObject("review", reviewInfo);

		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/review/movieReviewSave")
	@ResponseBody
	public Map<String, Object> movieReviewSave(Map<String,Object> condition, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		MovieReviewCondition movieReviewCondition = new MovieReviewCondition();

			
		movieReviewCondition.setMovieId(request.getParameter("movieId"));
		movieReviewCondition.setUserNo(WorkerId);
		movieReviewCondition.setReviewText(request.getParameter("reviewText"));
		movieReviewCondition.setWriterDiv(request.getParameter("writerDiv"));
		movieReviewCondition.setCreId(WorkerId);
		movieReviewCondition.setUpdId(WorkerId);
		movieReviewCondition.setImageSeq(request.getParameter("delegateImg"));
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = reviewService.addMovieReview(movieReviewCondition);
			map.put("reviewSeq", movieReviewCondition.getReviewSeq());
			logger.info("movieReviewCondition : "+movieReviewCondition.getReviewSeq());

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화 리뷰 정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/review/moviePriceSave")
	@ResponseBody
	public Map<String, Object> moviePriceSave(Map<String,Object> condition, HttpServletRequest request) {
		
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		MoviePriceCondition moviePriceCondition = new MoviePriceCondition();

			
		moviePriceCondition.setReviewSeq(request.getParameter("reviewSeq"));
		moviePriceCondition.setPriceDiv(request.getParameter("priceDiv"));
		moviePriceCondition.setPriceComment(request.getParameter("priceComment"));
		moviePriceCondition.setPrice(request.getParameter("price"));
		moviePriceCondition.setWriterDiv(request.getParameter("writerDiv"));
		moviePriceCondition.setCommentYn(StringUtils.nvl(request.getParameter("commentYn"), "N"));
		moviePriceCondition.setCreId(WorkerId);
		moviePriceCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = reviewService.addMoviePrice(moviePriceCondition);
			map.put("inputMode", request.getParameter("priceDiv"));
			//map = null;

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","적정 관람료 정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/review/checkUserReviewStatus", method = RequestMethod.GET)
	public String checkUserReviewStatus(Map<String,Object> condition, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(true);
		String WorkerId = (String)session.getAttribute("member.userNo");
		int iReviewCount = 0;
		int iReviewSeq = 0;
		
		MovieReviewCondition movieReviewCondition = new MovieReviewCondition();
		
		String viewPage = "";
		
		movieReviewCondition.setMovieId(request.getParameter("movieId"));
		movieReviewCondition.setUserNo(WorkerId);
		
		logger.info("getMovieId : "+movieReviewCondition.getMovieId());
		logger.info("getUserNo : "+movieReviewCondition.getUserNo());
		
		try {
			
			//iReviewCount = reviewService.getMovieReviewSeqByUserNo(movieReviewCondition);
			iReviewSeq = reviewService.getMovieReviewSeqByUserNo(movieReviewCondition);
			
			logger.info("reviewSeq : "+iReviewSeq);
			
			if(iReviewSeq > 0) {
				// 작성중인 유저 적정관람료가 있으면 상세 페이지로 이동
				viewPage = "redirect:/review/reviewDetail?movieId="+movieReviewCondition.getMovieId()+"&reviewSeq="+iReviewSeq;
			} else {
				// 작성중인 유저 적정관람료가 없으면...
				viewPage = "redirect:/review/reviewWrite?movieId="+movieReviewCondition.getMovieId();
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		
		return viewPage;
	}
	
	@RequestMapping(value = "/admin/review/moviePriceList", method = {RequestMethod.GET, RequestMethod.POST})
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMoviePriceList(Map<String,Object> condition, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/review/movie_price_list");
		List<Map<String, Object>> list;
		
		int pageNo = 1;
		int totalCount = 0;
		int totalPage = 0;
		int rowPerPage = 10;
		
		String strPageNo = "";
		
		strPageNo = StringUtils.nvl(request.getParameter("pageNo"));

		if(("").equals(strPageNo)) {
			strPageNo = "1";
		}
		
		pageNo = Integer.valueOf(strPageNo);
		
		try {
			list = reviewService.getMoviePriceList(condition, pageNo, rowPerPage);
			
			if(list.size() > 0) {
				totalCount = Integer.valueOf(list.get(0).get("totalCount").toString());
				totalPage = totalCount / rowPerPage;
			} else {
				totalCount = 0;
				totalPage = 0;
			}
			
			
			
			mav.addObject("list", list);
			mav.addObject("totalCount", totalCount);
			mav.addObject("totalPage", totalPage+1);
			mav.addObject("pageNo", strPageNo);
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
			
		}
		return mav;
	}
	
	@RequestMapping(value = "/admin/review/moviePriceDetail", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMoviePriceDetail(Map<String,Object> condition, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/review/movie_price_detail");
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
		
		pList = getOneMoviePriceList(reviewSeq , "P");
		nList= getOneMoviePriceList(reviewSeq , "N");
		
		try {
			movieInfo = movieService.getMovieInfo(condition);
			reviewInfo = reviewService.getReviewDetail(condition);
			condition.put("admin", "true");
			iList = movieService.getOneMovieImageList(condition);
			
			logger.info("pList : "+pList.size());
			logger.info("nList : "+nList.size());
			
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
	
	@RequestMapping(value = "/admin/review/moviePriceSave")
	@ResponseBody
	public Map<String, Object> adminMoviePriceSave(Map<String,Object> condition, HttpServletRequest request) {
		
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		MoviePriceCondition moviePriceCondition = new MoviePriceCondition();

			
		moviePriceCondition.setReviewSeq(request.getParameter("reviewSeq"));
		moviePriceCondition.setPriceDiv(request.getParameter("priceDiv"));
		moviePriceCondition.setPriceComment(request.getParameter("priceComment"));
		moviePriceCondition.setPrice(request.getParameter("price"));
		moviePriceCondition.setWriterDiv(request.getParameter("writerDiv"));
		moviePriceCondition.setCommentYn(StringUtils.nvl(request.getParameter("commentYn"), "N"));
		moviePriceCondition.setCreId(WorkerId);
		moviePriceCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = reviewService.addMoviePrice(moviePriceCondition);
			map.put("inputMode", request.getParameter("priceDiv"));
			//map = null;

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","적정 관람료 정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/admin/review/moviePriceModify")
	@ResponseBody
	public Map<String, Object> adminMoviePriceModify(Map<String,Object> condition, HttpServletRequest request) {

		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		MoviePriceCondition moviePriceCondition = new MoviePriceCondition();
		
		logger.info("moviePriceSeq : "+request.getParameter("moviePriceSeq"));
		logger.info("priceDiv : "+request.getParameter("priceDiv"));
		logger.info("priceComment : "+request.getParameter("priceComment"));
		
		logger.info("price : "+request.getParameter("price"));
		logger.info("commentYn : "+request.getParameter("commentYn"));

			
		moviePriceCondition.setMoviePriceSeq(request.getParameter("moviePriceSeq"));
		moviePriceCondition.setPriceDiv(request.getParameter("priceDiv"));
		moviePriceCondition.setPriceComment(request.getParameter("priceComment"));
		moviePriceCondition.setPrice(request.getParameter("price"));
		moviePriceCondition.setCommentYn(StringUtils.nvl(request.getParameter("commentYn"), "N"));
		moviePriceCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = reviewService.modifyMoviePrice(moviePriceCondition);
			//map = null;
			map.put("inputMode", request.getParameter("priceDiv"));

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","적정 관람료 정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/admin/review/movieReviewSave")
	@ResponseBody
	public Map<String, Object> adminMovieReviewSave(Map<String,Object> condition, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		MovieReviewCondition movieReviewCondition = new MovieReviewCondition();

			
		movieReviewCondition.setMovieId(request.getParameter("movieId"));
		movieReviewCondition.setUserNo(WorkerId);
		movieReviewCondition.setReviewText(request.getParameter("ir1"));
		movieReviewCondition.setWriterDiv(request.getParameter("writerDiv"));
		movieReviewCondition.setCreId(WorkerId);
		movieReviewCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = reviewService.addMovieReview(movieReviewCondition);
			map.put("reviewSeq", movieReviewCondition.getReviewSeq());
			logger.info("movieReviewCondition : "+movieReviewCondition.getReviewSeq());
			//map = null;

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화 리뷰 정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/admin/review/commentMove", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminMoviePriceCommentMove(Map<String,Object> condition, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		MoviePriceCondition moviePriceCondition = new MoviePriceCondition();

			
		moviePriceCondition.setPriceDiv(request.getParameter("tmpPriceDiv"));
		moviePriceCondition.setMoviePriceSeq(request.getParameter("tmpMoviePriceSeq"));
		moviePriceCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = reviewService.movePriceComment(moviePriceCondition);
			//map = null;

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","적정 관람료 정보 이동에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/admin/review/commentRemove", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminPriceCommentRemove(Map<String,Object> condition, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		MoviePriceCondition moviePriceCondition = new MoviePriceCondition();

		moviePriceCondition.setMoviePriceSeq(request.getParameter("tmpMoviePriceSeq"));
		moviePriceCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = reviewService.removePriceComment(moviePriceCondition);
			//map = null;

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","적정 관람료 정보 이동에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/admin/review/modifyReview", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminModifyReview(Map<String,Object> condition, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		MovieReviewCondition movieReviewCondition = new MovieReviewCondition();
		
		logger.info("reviewSeq : "+request.getParameter("reviewSeq"));

			
		movieReviewCondition.setReviewText(request.getParameter("ir1"));
		
		logger.info("review : "+request.getParameter("ir1"));
		
		movieReviewCondition.setReviewSeq(request.getParameter("reviewSeq"));
		movieReviewCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = reviewService.modifyReview(movieReviewCondition);

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화 감상평 정보 수정에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	public List<Map<String, Object>> getOneMoviePriceList(String strReviewSeq , String strPriceDiv) {
		
		MoviePriceCondition moviePriceCondition = new MoviePriceCondition();
		List<Map<String, Object>> list = null;
			
		moviePriceCondition.setReviewSeq(strReviewSeq);
		moviePriceCondition.setPriceDiv(strPriceDiv);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			list = reviewService.getOneMoviePriceList(moviePriceCondition);
			//list = null;

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","적정 관람료 정보 조회에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return list;
	}
	
}
