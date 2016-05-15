package com.mymovieprice.mmp.movie.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.movie.model.MovieImage;
import com.mymovieprice.mmp.movie.model.MovieImageCondition;
import com.mymovieprice.mmp.movie.model.MovieMaster;
import com.mymovieprice.mmp.movie.model.MoviePriceCondition;

public interface MovieService {
	
	public MovieMaster getMovieInfo(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getMovieList(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getMovieListByEditor(Map<String,Object> condition) throws Exception;
	
	public Map<String, Object> addMovieMaster(MovieCondition movieCondition) throws Exception;
	
	public List<Map<String,Object>> getOneMovieImageList(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getMovieImageList(Map<String,Object> condition) throws Exception;
	
	public Map<String, Object> addMovieImage(MovieImageCondition movieImgCondition) throws Exception;
	
	public Map<String, Object> modifyMovieImage(MovieImageCondition movieImgCondition) throws Exception;
	
	public int disableDelegateMovie(MovieImageCondition movieImgCondition) throws Exception;
	
	public List<Map<String,Object>> getMoviePriceList(Map<String,Object> condition) throws Exception;
	
	public Map<String, Object> addMoviePrice(MoviePriceCondition moviePriceCondition) throws Exception;
	
	public List<Map<String,Object>> getOneMoviePriceList(MoviePriceCondition moviePriceCondition) throws Exception;

}
