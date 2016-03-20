package com.mymovieprice.mmp.test.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;

@Repository("testRepository")
public class TestRepository extends AbstractDao {
	
	private static final Logger logger = LoggerFactory.getLogger(TestRepository.class);

	public List<Map<String, Object>> selectUserList(
			Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("test.selectUserInfo", condition);
		//return null;
	}

}
