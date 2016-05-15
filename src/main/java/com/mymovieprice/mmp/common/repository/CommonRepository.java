package com.mymovieprice.mmp.common.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("commonRepository")
public class CommonRepository extends AbstractDao {
	private static final Logger logger = LoggerFactory.getLogger(CommonRepository.class);
	
	public List<Map<String, Object>> selectDetailList(Map<String,Object> condition) {
		
		return (List<Map<String, Object>>)selectList("common.selectDetailList", condition);
		//return null;
	}
	
	public List<Map<String, Object>> selectDetailUseList(Map<String,Object> condition) {
		
		return (List<Map<String, Object>>)selectList("common.selectDetailUseList", condition);
		//return null;
	}
}
