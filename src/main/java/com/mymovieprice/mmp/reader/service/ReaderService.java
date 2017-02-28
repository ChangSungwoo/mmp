package com.mymovieprice.mmp.reader.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.reader.model.ReaderCondition;
import com.mymovieprice.mmp.reader.model.ReaderMaster;

public interface ReaderService {
	
	public List<Map<String,Object>> getFrontReaderList(Map<String,Object> condition) throws Exception;
	
	public ReaderMaster getReaderInfo(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getReaderList(Map<String,Object> condition) throws Exception;
	
	public Map<String, Object> addReaderMaster(ReaderCondition readerCondition) throws Exception;

}
