package com.mymovieprice.mmp.reader.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;
import com.mymovieprice.mmp.reader.model.ReaderCondition;
import com.mymovieprice.mmp.reader.model.ReaderMaster;

@Repository("readerRepository")
public class ReaderRepository extends AbstractDao {
	private static final Logger logger = LoggerFactory.getLogger(ReaderRepository.class);
	
	public ReaderMaster selectReaderMaster(Map<String, Object> condition) {
		return (ReaderMaster)selectOne("reader.selectReaderMaster", condition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFrontReaderList(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("reader.selectFrontReaderList", condition);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReaderList(Map<String, Object> condition) {
		
		return (List<Map<String, Object>>)selectList("reader.selectReaderMasterList", condition);
	}
	
	public int insertReaderMaster(ReaderCondition readerCondition) {
		
		return (Integer)insert("reader.insertReaderMaster", readerCondition);
	}

}
