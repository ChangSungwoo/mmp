package com.mymovieprice.mmp.review.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;
import com.mymovieprice.mmp.review.model.MovieReview;

@Repository("reviewRepository")
public class ReviewRepository extends AbstractDao {
	private static final Logger logger = LoggerFactory.getLogger(ReviewRepository.class);
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewListByEditor(
			Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("review.selectReviewListByEditor", condition);
	}
	
	public MovieReview selectReviewInfo(Map<String, Object> condition) {
		return (MovieReview)selectOne("review.selectMovieReview", condition);
	}

}
