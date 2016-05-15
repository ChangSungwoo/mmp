package com.mymovieprice.mmp.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.movie.repository.MovieRepository;
import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.movie.model.MovieImage;
import com.mymovieprice.mmp.movie.model.MovieImageCondition;
import com.mymovieprice.mmp.movie.model.MovieMaster;
import com.mymovieprice.mmp.movie.model.MoviePriceCondition;


@Service("movieService")
public class MovieServiceImpl implements MovieService {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieServiceImpl.class);
	
	@Resource(name="movieRepository")
	private MovieRepository movieRepository;
	
	@Override
	public MovieMaster getMovieInfo(Map<String, Object> condition) throws Exception {
		logger.info(""+condition.get("movieId"));
		return movieRepository.selectMovieMaster(condition);
	}
	
	@Override
	public List<Map<String,Object>> getMovieList(Map<String,Object> condition) throws Exception {
		
		return movieRepository.selectMovieList(condition);
	}
	
	@Override
	public List<Map<String,Object>> getMovieListByEditor(Map<String,Object> condition) throws Exception {
		
		return movieRepository.selectMovieListByEditor(condition);
	}
	
	@Override
	public Map<String, Object> addMovieMaster(MovieCondition movieCondition) throws Exception {
		
		int rsltCnt = movieRepository.insertMovieMaster(movieCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}
	
	@Override
	public List<Map<String,Object>> getMovieImageList(Map<String,Object> condition) throws Exception {
		
		return movieRepository.selectMovieImageList(condition);
	}

	@Override
	public List<Map<String,Object>> getOneMovieImageList(Map<String, Object> condition)
			throws Exception {
		return movieRepository.selectOneMovieImageList(condition);
	}

	@Override
	public Map<String, Object> addMovieImage(MovieImageCondition movieImgCondition) throws Exception {
		
		int rsltCnt = movieRepository.insertMovieImage(movieImgCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}

	@Override
	public Map<String, Object> modifyMovieImage(MovieImageCondition movieImgCondition) throws Exception {
		// TODO Auto-generated method stub
		int rsltCnt = movieRepository.updateMovieImage(movieImgCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}

	@Override
	public int disableDelegateMovie(MovieImageCondition movieImgCondition) throws Exception {
		
		return movieRepository.updateDelegateImgDiable(movieImgCondition);
	}

	@Override
	public List<Map<String,Object>> getMoviePriceList(Map<String,Object> condition) throws Exception {
		
		
		return movieRepository.selectAdminMoviePriceList(condition);
	}
	
	@Override
	public Map<String, Object> addMoviePrice(MoviePriceCondition moviePriceCondition) throws Exception {
		
		int rsltCnt = movieRepository.insertMoviePrice(moviePriceCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}

	@Override
	public List<Map<String, Object>> getOneMoviePriceList(MoviePriceCondition moviePriceCondition) throws Exception {
		return movieRepository.selectMoviePriceList(moviePriceCondition);
	}

}
