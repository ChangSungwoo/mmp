package com.mymovieprice.mmp.reader.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.reader.model.ReaderCondition;
import com.mymovieprice.mmp.reader.model.ReaderMaster;
import com.mymovieprice.mmp.reader.repository.ReaderRepository;

@Service("readerService")
public class ReaderServiceImpl implements ReaderService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReaderServiceImpl.class);
	
	@Resource(name="readerRepository")
	private ReaderRepository readerRepository;
	
	@Override
	public List<Map<String,Object>> getFrontReaderList(Map<String,Object> condition) throws Exception {
		return readerRepository.selectFrontReaderList(condition);
	}

	@Override
	public ReaderMaster getReaderInfo(Map<String, Object> condition) throws Exception {
		return readerRepository.selectReaderMaster(condition);
	}

	@Override
	public List<Map<String, Object>> getReaderList(Map<String, Object> condition) throws Exception {
		return readerRepository.selectReaderList(condition);
	}

	@Override
	public Map<String, Object> addReaderMaster(ReaderCondition readerCondition) throws Exception {
		
		int rsltCnt = readerRepository.insertReaderMaster(readerCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}

}
