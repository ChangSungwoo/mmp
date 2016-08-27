package com.mymovieprice.mmp.review.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;
import com.mymovieprice.mmp.review.model.MoviePriceCondition;
import com.mymovieprice.mmp.review.model.MovieReviewCondition;
import com.mymovieprice.mmp.review.model.MovieReview;
import com.mymovieprice.mmp.review.model.ReviewRecommCondition;
import com.mymovieprice.mmp.util.StringUtils;

@Repository("reviewRepository")
public class ReviewRepository extends AbstractDao {
	private static final Logger logger = LoggerFactory.getLogger(ReviewRepository.class);
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewListByEditor(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("review.selectReviewListByEditor", condition);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewListByUser(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("review.selectReviewListByUser", condition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserReviewListByMovie(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("review.selectUserReviewListByMovie", condition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOldReviewListByEditor(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("review.selectOldReviewListByEditor", condition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOldReviewListByUser(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("review.selectOldReviewListByUser", condition);
	}
	
	public MovieReview selectReviewInfo(Map<String, Object> condition) {
		return (MovieReview)selectOne("review.selectMovieReview", condition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminMoviePriceList(Map<String,Object> condition) {
		
		return (List<Map<String, Object>>)selectList("review.selectMoviePriceList", condition);
		//return null;
	}
	
	public int insertMoviePrice(MoviePriceCondition moviePriceCondition) {
		
		return (Integer)insert("review.insertMoviePrice", moviePriceCondition);
	}
	
	public int updateMoviePrice(MoviePriceCondition moviePriceCondition) {
		
		return (Integer)update("review.updateMoviePrice", moviePriceCondition);
	}
	
	public int insertMovieReview(MovieReviewCondition movieReviewCondition) {
		
		return (Integer)insert("review.insertMovieReview", movieReviewCondition);
	}
	
	public int updatePriceDiv(MoviePriceCondition moviePriceCondition) {
		
		return (Integer)update("review.updatePriceDiv", moviePriceCondition);
	}
	
	public int updatePriceCommentUseYn(MoviePriceCondition moviePriceCondition) {
		
		return (Integer)update("review.updatePriceCommentUseYn", moviePriceCondition);
	}
	
	public int updateReview(MovieReviewCondition movieReviewCondition) {
		
		return (Integer)update("review.updateReview", movieReviewCondition);
	}	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMoviePriceList(MoviePriceCondition moviePriceCondition) {
		
		return (List<Map<String, Object>>)selectList("review.selectOneMoviePrice", moviePriceCondition);
		//return null;
	}
	
	public int insertReviewRecomm(ReviewRecommCondition reviewRecommCondition) {
		return (Integer)insert("review.insertReviewRecommend", reviewRecommCondition);
	}
	
	@SuppressWarnings("unchecked")
	public int selectReviewSeqByUserNo(MovieReviewCondition movieReviewCondition) {
		
		int iRtnValue = 0;
		String tVal = null;
		
		tVal = (String) selectOne("review.selectReviewSeqByUserNo", movieReviewCondition);
		
		iRtnValue = (Integer)StringUtils.nvl(tVal,0);
		
		return iRtnValue;
	}

	public int selectMoviePriceCount(MovieReviewCondition movieReviewCondition) {
		
		
		return (Integer)selectOne("review.selectMoviePriceCount", movieReviewCondition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewListByOneUser(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("review.selectReviewListByOneUser", condition);
	}
}
