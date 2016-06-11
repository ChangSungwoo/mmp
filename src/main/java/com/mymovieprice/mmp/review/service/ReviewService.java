package com.mymovieprice.mmp.review.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.review.model.MovieReview;

public interface ReviewService {

	public List<Map<String,Object>> getReviewListByEditor(Map<String,Object> condition) throws Exception;
	
	public MovieReview getReviewDetail(Map<String,Object> condition) throws Exception;
}
