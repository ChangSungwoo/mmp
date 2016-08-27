package com.mymovieprice.mmp.member.service;

import java.util.List;
import java.util.Map;

import com.mymovieprice.mmp.member.model.Member;
import com.mymovieprice.mmp.member.model.MemberCondition;


public interface MemberService {

	public Map<String, Object> addMember(MemberCondition memberCondition) throws Exception;
	
	public Member getLoginUserInfo(MemberCondition memberCondition) throws Exception;
	
	public List<Map<String,Object>> getMemberList(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getMyFavoriteUserList(Map<String,Object> condition) throws Exception;
	
	public List<Map<String,Object>> getFavoriteMeUserList(Map<String,Object> condition) throws Exception;
}
