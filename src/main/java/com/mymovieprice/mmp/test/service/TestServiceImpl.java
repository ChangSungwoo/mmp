package com.mymovieprice.mmp.test.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.test.repository.TestRepository;


@Service("testService")
public class TestServiceImpl implements TestService {
	
	//@Autowired
	//testRepository testRepository;
	
	@Resource(name="testRepository")
	private TestRepository testRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(TestServiceImpl.class);
	
	@Override
	public List<Map<String,Object>> getUserList(Map<String,Object> condition) throws Exception{
		
		return testRepository.selectUserList(condition);
	}

}
