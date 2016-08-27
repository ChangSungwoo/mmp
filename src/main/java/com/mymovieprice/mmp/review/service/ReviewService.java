package com.mymovieprice.mmp.review.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.review.model.MoviePriceCondition;
import com.mymovieprice.mmp.review.model.MovieReviewCondition;
import com.mymovieprice.mmp.review.model.MovieReview;
import com.mymovieprice.mmp.review.model.ReviewRecommCondition;

public interface ReviewService {

	public List<Map<String,Object>> getReviewListByEditor(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getReviewListByUser(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getUserReviewListByMovie(Map<String,Object> condition) throws Exception;
	
	
	public List<Map<String,Object>> getOldReviewListByEditor(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getOldReviewListByUser(Map<String,Object> condition) throws Exception;
	
	public MovieReview getReviewDetail(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getMoviePriceList(Map<String,Object> condition, int currPage, int rowPerPage) throws Exception;
	
	public Map<String, Object> addMoviePrice(MoviePriceCondition moviePriceCondition) throws Exception;
	
	public Map<String, Object> modifyMoviePrice(MoviePriceCondition moviePriceCondition) throws Exception;
	
	public Map<String, Object> addMovieReview(MovieReviewCondition movieReviewCondition) throws Exception;
	
	public Map<String, Object> movePriceComment(MoviePriceCondition moviePriceCondition) throws Exception;
	
	public Map<String, Object> removePriceComment(MoviePriceCondition moviePriceCondition) throws Exception;
	
	public Map<String, Object> modifyReview(MovieReviewCondition movieReviewCondition) throws Exception;
	
	public List<Map<String,Object>> getOneMoviePriceList(MoviePriceCondition moviePriceCondition) throws Exception;
	
	public Map<String, Object> addReviewRecomm(ReviewRecommCondition reviewRecommCondition) throws Exception;
	
	public int getMovieReviewSeqByUserNo(MovieReviewCondition movieReviewCondition) throws Exception;
	
	public int getMoviePriceCount(MovieReviewCondition movieReviewCondition) throws Exception;
	
	public List<Map<String,Object>> getReviewListByOneUser(Map<String,Object> condition) throws Exception;
}
