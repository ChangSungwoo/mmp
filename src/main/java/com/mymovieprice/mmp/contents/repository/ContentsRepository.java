package com.mymovieprice.mmp.contents.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;
import com.mymovieprice.mmp.contents.model.ContentMasterCondition;

@Repository("contentsRepository")
public class ContentsRepository extends AbstractDao  {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieList(
			Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("movie.selectMovieMasterList", condition);
		//return null;
	}
	
	public int insertMainContent(ContentMasterCondition contentCondition) {
		
		return (Integer)insert("contents.insertMainContent", contentCondition);
	}

}
