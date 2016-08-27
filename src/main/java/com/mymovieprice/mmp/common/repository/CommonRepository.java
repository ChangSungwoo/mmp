package com.mymovieprice.mmp.common.repository;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.model.CodeDetail;
import com.mymovieprice.mmp.common.model.CodeMaster;

@Repository("commonRepository")
public class CommonRepository extends AbstractDao {
	private static final Logger logger = LoggerFactory.getLogger(CommonRepository.class);
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDetailList(Map<String,Object> condition) {
		
		return (List<Map<String, Object>>)selectList("common.selectDetailList", condition);
		//return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDetailUseList(Map<String,Object> condition) {
		
		return (List<Map<String, Object>>)selectList("common.selectDetailUseList", condition);
		//return null;
	}
	
	public CodeMaster selectCommonCodeMaster(Map<String,Object> condition) {
		
		return (CodeMaster)selectOne("common.selectCommonCodeMasterOne", condition);
		//return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommonCodeMasterList(Map<String,Object> condition) {
		
		return (List<Map<String, Object>>)selectList("common.selectCommonCodeMasterList", condition);
		//return null;
	}
	
	public int insertCodeMaster(CodeMaster codeMaster) {
		
		return (Integer)insert("common.insertCommonCodeMaster", codeMaster);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommonCodeDetailList(Map<String,Object> condition) {
		
		return (List<Map<String, Object>>)selectList("common.selectCommonCodeDetailList", condition);
		//return null;
	}
	
	public int insertCodeDetail(CodeDetail codeDetail) {
		
		return (Integer)insert("common.insertCommonCodeDetail", codeDetail);
	}
}
