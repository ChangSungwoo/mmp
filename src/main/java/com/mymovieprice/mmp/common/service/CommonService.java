package com.mymovieprice.mmp.common.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.common.model.CodeDetail;
import com.mymovieprice.mmp.common.model.CodeMaster;
import com.mymovieprice.mmp.movie.model.MovieCondition;

public interface CommonService {
	
	public List<Map<String,Object>> getDetailList(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getDetailUseList(Map<String,Object> condition) throws Exception;
	
	public CodeMaster getCommonCodeMasterOne(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getCommonCodeMasterList(Map<String,Object> condition, int currPage, int rowPerPage) throws Exception;
	
	public Map<String, Object> addCommonCodeMaster(CodeMaster codeMaster) throws Exception;
	
	public List<Map<String,Object>> getCommonCodeDetailList(Map<String,Object> condition, int currPage, int rowPerPage) throws Exception;
	
	public Map<String, Object> addCommonCodeDetail(CodeDetail codeDetail) throws Exception;

}
