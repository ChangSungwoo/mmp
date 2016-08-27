package com.mymovieprice.mmp.main.service;

import java.util.List;
import java.util.Map;

public interface MainService {

	public List<Map<String,Object>> getMainContentList(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getMainSubReviewList(Map<String,Object> condition) throws Exception;
	
}
