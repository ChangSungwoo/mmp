package com.mymovieprice.mmp.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.review.model.MovieReview;
import com.mymovieprice.mmp.review.repository.ReviewRepository;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Resource(name="reviewRepository")
	private ReviewRepository reviewRepository;
	
	@Override
	public List<Map<String,Object>> getReviewListByEditor(Map<String,Object> condition) throws Exception {
		
		return reviewRepository.selectReviewListByEditor(condition);
	}
	
	@Override
	public MovieReview getReviewDetail(Map<String,Object> condition) throws Exception {
		
		return reviewRepository.selectReviewInfo(condition);
	}

}
