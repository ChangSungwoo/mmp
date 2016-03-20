package com.mymovieprice.mmp.movie.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;
import com.mymovieprice.mmp.movie.model.MovieCondition;


@Repository("movieRepository")
public class MovieRepository extends AbstractDao {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieRepository.class);
	
	public List<Map<String, Object>> selectMovieList(
			Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("movie.selectMovieMaster", condition);
		//return null;
	}
	
	public int insertMovieMaster(MovieCondition movieCondition) {
		
		return (Integer)insert("movie.insertMovieMaster", movieCondition);
	}

}
