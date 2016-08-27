package com.mymovieprice.mmp.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.main.repository.MainRepository;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Resource(name="mainRepository")
	private MainRepository mainRepository;

	@Override
	public List<Map<String, Object>> getMainContentList(Map<String, Object> condition) throws Exception {
		
		return mainRepository.selectMainContentList(condition);
	}

	@Override
	public List<Map<String, Object>> getMainSubReviewList(Map<String, Object> condition) throws Exception {
		
		return mainRepository.selectMainSubReviewList(condition);
	}

}
