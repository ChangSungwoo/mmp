package com.mymovieprice.mmp.main.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;
import com.mymovieprice.mmp.movie.repository.MovieRepository;

@Repository("mainRepository")
public class MainRepository extends AbstractDao{
	
	private static final Logger logger = LoggerFactory.getLogger(MovieRepository.class);
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainContentList(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("main.selectMainContent", condition);
		//return null;
	}

}
