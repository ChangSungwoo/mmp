package com.mymovieprice.mmp.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.common.repository.CommonRepository;

@Service("commonService")
public class CommonServiceImpl  implements CommonService  {
	
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

}
