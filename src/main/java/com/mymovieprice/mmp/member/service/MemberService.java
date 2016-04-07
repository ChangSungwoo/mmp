package com.mymovieprice.mmp.member.service;

import java.util.Map;

import com.mymovieprice.mmp.member.model.Member;
import com.mymovieprice.mmp.member.model.MemberCondition;


public interface MemberService {

	public Map<String, Object> addMember(MemberCondition memberCondition) throws Exception;
	
	public Member getLoginUserInfo(MemberCondition memberCondition) throws Exception;
}
