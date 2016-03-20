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


@Service("movieService")
public class MovieServiceImpl implements MovieService {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieServiceImpl.class);
	
	@Resource(name="movieRepository")
	private MovieRepository movieRepository;
	
	@Override
	public List<Map<String,Object>> getMovieList(Map<String,Object> condition) throws Exception {
		
		return movieRepository.selectMovieList(condition);
	}
	
	@Override
	public Map<String, Object> addMovieMaster(MovieCondition movieCondition) throws Exception {
		
		int rsltCnt = movieRepository.insertMovieMaster(movieCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}

}
