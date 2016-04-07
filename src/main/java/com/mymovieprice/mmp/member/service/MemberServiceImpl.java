package com.mymovieprice.mmp.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mymovieprice.mmp.member.model.Member;
import com.mymovieprice.mmp.member.model.MemberCondition;
import com.mymovieprice.mmp.member.repository.MemberRepository;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="memberRepository")
	private MemberRepository memberRepository;

	@Override
	public Map<String, Object> addMember(MemberCondition memberCondition) throws Exception {
		
		int rsltCnt = memberRepository.insertMember(memberCondition);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCnt" , rsltCnt);
		
		return map;
	}

	@Override
	public Member getLoginUserInfo(MemberCondition memberCondition) throws Exception {
		// TODO Auto-generated method stub
		return memberRepository.selectMember(memberCondition);
	}
	
	

}
