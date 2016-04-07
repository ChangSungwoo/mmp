package com.mymovieprice.mmp.member.repository;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mymovieprice.mmp.common.repository.AbstractDao;
import com.mymovieprice.mmp.member.model.Member;
import com.mymovieprice.mmp.member.model.MemberCondition;

@Repository("memberRepository")
public class MemberRepository  extends AbstractDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberRepository.class);
	
	public int insertMember(MemberCondition memberCondition) {
		
		return (Integer)insert("member.insertMember", memberCondition);
	}
	
	public Member selectMember(MemberCondition memberCondition) {
		
		return (Member)selectOne("member.selectLoginInfo", memberCondition);
	}

}
