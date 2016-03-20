package com.mymovieprice.mmp.test.service;

import java.util.List;
import java.util.Map;

public interface TestService {
	public List<Map<String,Object>> getUserList(Map<String,Object> condition) throws Exception;
}
