package com.mymovieprice.mmp.movie.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.movie.model.MovieCondition;

public interface MovieService {
	
	public List<Map<String,Object>> getMovieList(Map<String,Object> condition) throws Exception;
	
	public Map<String, Object> addMovieMaster(MovieCondition movieCondition) throws Exception;
	
	public List<Map<String,Object>> getMovieImageList(Map<String,Object> condition) throws Exception;

}
