package com.mymovieprice.mmp.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {
	
	public List<Map<String,Object>> getDetailList(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getDetailUseList(Map<String,Object> condition) throws Exception;

}
