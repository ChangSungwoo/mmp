package com.mymovieprice.mmp.contents.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.contents.model.ContentMasterCondition;
import com.mymovieprice.mmp.contents.repository.ContentsRepository;


@Service("contentsService")
public class ContentsServiceImpl implements ContentsService {
	
	private static final Logger logger = LoggerFactory.getLogger(ContentsServiceImpl.class);
	
	@Resource(name="contentsRepository")
	private ContentsRepository contentsRepository;

	@Override
	public List<Map<String, Object>> getMainContentList(Map<String, Object> condition) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> addMadinContent(ContentMasterCondition contentCondition) throws Exception {
		// TODO Auto-generated method stub
		
		int rsltCnt = contentsRepository.insertMainContent(contentCondition);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}

}
