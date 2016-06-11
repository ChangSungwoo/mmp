package com.mymovieprice.mmp.contents.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.contents.model.ContentMasterCondition;

public interface ContentsService {
	
	public List<Map<String,Object>> getMainContentList(Map<String,Object> condition) throws Exception;
	
	public Map<String, Object> addMadinContent(ContentMasterCondition contentCondition) throws Exception;
	

}
