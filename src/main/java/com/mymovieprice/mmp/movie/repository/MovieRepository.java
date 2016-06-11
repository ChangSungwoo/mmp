package com.mymovieprice.mmp.movie.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;
import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.movie.model.MovieImageCondition;
import com.mymovieprice.mmp.movie.model.MovieMaster;
import com.mymovieprice.mmp.movie.model.MoviePriceCondition;
import com.mymovieprice.mmp.movie.model.MovieReviewCondition;


@Repository("movieRepository")
public class MovieRepository extends AbstractDao {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieRepository.class);
	
	public MovieMaster selectMovieMaster(Map<String, Object> condition) {
		return (MovieMaster)selectOne("movie.selectMovieMaster", condition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieList(
			Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("movie.selectMovieMasterList", condition);
		//return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieListByEditor(
			Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("movie.selectMovieListByEditor", condition);
	}
	

	
	public int insertMovieMaster(MovieCondition movieCondition) {
		
		return (Integer)insert("movie.insertMovieMaster", movieCondition);
	}
	
	public int updateMovieMaster(MovieCondition movieCondition) {
		
		return (Integer)update("movie.updateMovieMaster", movieCondition);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOneMovieImageList(
			Map<String, Object> condition) {
		logger.info("parameter : "+condition.get("movieId"));
		
		return (List<Map<String, Object>>)selectList("movie.selectOneMovieImageList", condition);
		//return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieImageList(
			Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("movie.selectMovieImage", condition);
		//return null;
	}
	
	public int insertMovieImage(MovieImageCondition movieImgCondition) {
		
		return (Integer)insert("movie.insertMovieImage", movieImgCondition);
	}
	
	public int updateMovieImage(MovieImageCondition movieImgCondition) {
		
		return (Integer)update("movie.updateMovieImage", movieImgCondition);
	}
	
	public int updateDelegateImgDiable(MovieImageCondition movieImgCondition) {
		
		return (Integer)update("movie.delegateImgDisable", movieImgCondition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminMoviePriceList(Map<String,Object> condition) {
		
		return (List<Map<String, Object>>)selectList("movie.selectMoviePriceList", condition);
		//return null;
	}
	
	public int insertMoviePrice(MoviePriceCondition moviePriceCondition) {
		
		return (Integer)insert("movie.insertMoviePrice", moviePriceCondition);
	}
	
	public int insertMovieReview(MovieReviewCondition movieReviewCondition) {
		
		return (Integer)insert("movie.insertMovieReview", movieReviewCondition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMoviePriceList(MoviePriceCondition moviePriceCondition) {
		
		return (List<Map<String, Object>>)selectList("movie.selectOneMoviePrice", moviePriceCondition);
		//return null;
	}
}
