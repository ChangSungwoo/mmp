package com.mymovieprice.mmp.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.common.model.CodeDetail;
import com.mymovieprice.mmp.common.model.CodeMaster;
import com.mymovieprice.mmp.common.repository.CommonRepository;
import com.mymovieprice.mmp.common.web.PagingHelper;
import com.mymovieprice.mmp.movie.model.MovieCondition;

@Service("commonService")
public class CommonServiceImpl  implements CommonService  {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonServiceImpl.class);
	
	@Resource(name="commonRepository")
	private CommonRepository commonRepository;

	@Override
	public List<Map<String, Object>> getDetailList(Map<String,Object> condition) throws Exception {
		
		return commonRepository.selectDetailList(condition);
	}

	@Override
	public List<Map<String, Object>> getDetailUseList(Map<String, Object> condition) throws Exception {
		// TODO Auto-generated method stub
		return commonRepository.selectDetailUseList(condition);
	}
	
	@Override
	public CodeMaster getCommonCodeMasterOne(Map<String, Object> condition) throws Exception {
		return commonRepository.selectCommonCodeMaster(condition);
	}
	
	@Override
	public List<Map<String, Object>> getCommonCodeMasterList(Map<String, Object> condition, int currPage, int rowPerPage) throws Exception {
		PagingHelper pagingHelper = new PagingHelper(currPage, rowPerPage);
		
		condition.put("pagingHelper" , pagingHelper);
		return commonRepository.selectCommonCodeMasterList(condition);
	}
	
	@Override
	public Map<String, Object> addCommonCodeMaster(CodeMaster codeMaster) throws Exception {
		
		int rsltCnt = commonRepository.insertCodeMaster(codeMaster);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}
	
	@Override
	public List<Map<String, Object>> getCommonCodeDetailList(Map<String, Object> condition, int currPage, int rowPerPage) throws Exception {
		PagingHelper pagingHelper = new PagingHelper(currPage, rowPerPage);
		
		condition.put("pagingHelper" , pagingHelper);
		return commonRepository.selectCommonCodeDetailList(condition);
	}

	@Override
	public Map<String, Object> addCommonCodeDetail(CodeDetail codeDetail) throws Exception {
		
		int rsltCnt = commonRepository.insertCodeDetail(codeDetail);
		logger.debug("rsltCnt : "+rsltCnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}

}
