package com.mymovieprice.mmp.movie.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.movie.model.MovieImage;
import com.mymovieprice.mmp.movie.model.MovieImageCondition;
import com.mymovieprice.mmp.movie.model.MovieMaster;

public interface MovieService {
	
	public MovieMaster getMovieInfo(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getMovieList(Map<String,Object> condition, int currPage, int rowPerPage) throws Exception;
	
	public List<Map<String,Object>> getMovieListByEditor(Map<String,Object> condition) throws Exception;
	
	public MovieImage getDelegateImage(Map<String,Object> condition) throws Exception;
	
	public Map<String, Object> addMovieMaster(MovieCondition movieCondition) throws Exception;
	
	public Map<String, Object> editMovieMaster(MovieCondition movieCondition) throws Exception;
	
	public List<Map<String,Object>> getOneMovieImageList(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getMovieImageList(Map<String,Object> condition) throws Exception;
	
	public Map<String, Object> addMovieImage(MovieImageCondition movieImgCondition) throws Exception;
	
	public Map<String, Object> modifyMovieImage(MovieImageCondition movieImgCondition) throws Exception;
	
	public Map<String, Object> deleteMovieImage(MovieImageCondition movieImgCondition) throws Exception;
	
	public int disableDelegateMovie(MovieImageCondition movieImgCondition) throws Exception;
	


}
