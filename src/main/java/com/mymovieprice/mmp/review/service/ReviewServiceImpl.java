package com.mymovieprice.mmp.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.review.model.MoviePriceCondition;
import com.mymovieprice.mmp.review.model.MovieReviewCondition;
import com.mymovieprice.mmp.review.model.ReviewRecommCondition;
import com.mymovieprice.mmp.common.web.PagingHelper;
import com.mymovieprice.mmp.movie.service.MovieServiceImpl;
import com.mymovieprice.mmp.review.model.MovieReview;
import com.mymovieprice.mmp.review.repository.ReviewRepository;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	private static final Logger logger = LoggerFactory.getLogger(MovieServiceImpl.class);
	
	@Resource(name="reviewRepository")
	private ReviewRepository reviewRepository;
	
	@Override
	public List<Map<String,Object>> getReviewListByEditor(Map<String,Object> condition) throws Exception {
		
		return reviewRepository.selectReviewListByEditor(condition);
	}
	
	@Override
	public List<Map<String,Object>> getReviewListByUser(Map<String,Object> condition) throws Exception {
		
		return reviewRepository.selectReviewListByUser(condition);
	}
	
	@Override
	public List<Map<String,Object>> getUserReviewListByMovie(Map<String,Object> condition) throws Exception {
		return reviewRepository.selectUserReviewListByMovie(condition);
	}
	
	@Override
	public List<Map<String,Object>> getOldReviewListByEditor(Map<String,Object> condition) throws Exception {
		
		return reviewRepository.selectOldReviewListByEditor(condition);
	}
	
	@Override
	public List<Map<String,Object>> getOldReviewListByUser(Map<String,Object> condition) throws Exception {
		
		return reviewRepository.selectOldReviewListByUser(condition);
	}
	
	@Override
	public MovieReview getReviewDetail(Map<String,Object> condition) throws Exception {
		
		return reviewRepository.selectReviewInfo(condition);
	}
	
	@Override
	public List<Map<String,Object>> getMoviePriceList(Map<String,Object> condition, int currPage, int rowPerPage) throws Exception {
		PagingHelper pagingHelper = new PagingHelper(currPage, rowPerPage);
		
		condition.put("pagingHelper" , pagingHelper);
		
		return reviewRepository.selectAdminMoviePriceList(condition);
	}
	
	@Override
	public Map<String, Object> addMoviePrice(MoviePriceCondition moviePriceCondition) throws Exception {
		
		int rsltCnt = reviewRepository.insertMoviePrice(moviePriceCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}
	
	@Override
	public Map<String, Object> modifyMoviePrice(MoviePriceCondition moviePriceCondition) throws Exception {
		int rsltCnt = reviewRepository.updateMoviePrice(moviePriceCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}
	
	
	@Override
	public Map<String, Object> addMovieReview(MovieReviewCondition movieReviewCondition) throws Exception {
		
		int rsltCnt = reviewRepository.insertMovieReview(movieReviewCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}
	
	@Override
	public Map<String, Object> movePriceComment(MoviePriceCondition moviePriceCondition) throws Exception {
		
		int rsltCnt = reviewRepository.updatePriceDiv(moviePriceCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;

	}
	
	@Override
	public Map<String, Object> removePriceComment(MoviePriceCondition moviePriceCondition) throws Exception {
		
		int rsltCnt = reviewRepository.updatePriceCommentUseYn(moviePriceCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;

	}
	
	@Override
	public Map<String, Object> modifyReview(MovieReviewCondition movieReviewCondition) throws Exception {
		// TODO Auto-generated method stub
		
		int rsltCnt = reviewRepository.updateReview(movieReviewCondition);
		//int rsltCnt = 0;
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;

	}

	@Override
	public List<Map<String, Object>> getOneMoviePriceList(MoviePriceCondition moviePriceCondition) throws Exception {
		return reviewRepository.selectMoviePriceList(moviePriceCondition);
	}

	@Override
	public int getMovieReviewSeqByUserNo(MovieReviewCondition movieReviewCondition) throws Exception {
		// TODO Auto-generated method stub
		return reviewRepository.selectReviewSeqByUserNo(movieReviewCondition);
	}
	
	@Override
	public int getMoviePriceCount(MovieReviewCondition movieReviewCondition) throws Exception {
		// TODO Auto-generated method stub
		return reviewRepository.selectMoviePriceCount(movieReviewCondition);
	}

	@Override
	public Map<String, Object> addReviewRecomm(ReviewRecommCondition reviewRecommCondition) throws Exception {
		
		int rsltCnt = reviewRepository.insertReviewRecomm(reviewRecommCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}
	
	
	@Override
	public List<Map<String,Object>> getReviewListByOneUser(Map<String,Object> condition) throws Exception {
		
		return reviewRepository.selectReviewListByOneUser(condition);
	}
	
}
