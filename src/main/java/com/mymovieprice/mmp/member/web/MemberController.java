package com.mymovieprice.mmp.member.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.main.web.MainController;

/**
 * <pre>
 * 클래스명 : com.mymovieprice.mmp.member.web.MemberController.java
 * 기능요약 : 로그인, 회원 가입, 페이스북 로그인등 회원 관련 서비스 컨트롤러
 * 생성일 : 2016. 03. 23.
 * </pre>
 */

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public ModelAndView login(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("member/member_login");
		
		return mav;
	}
	
	@RequestMapping(value = "/member/regist", method = RequestMethod.GET)
	public ModelAndView regist(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("member/member_regist");
		
		return mav;
	}
	
	@RequestMapping(value = "/member/myPage", method = RequestMethod.GET)
	public ModelAndView myPage(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("member/myPage");
		
		return mav;
	}
	
	@RequestMapping(value = "/member/myPage2", method = RequestMethod.GET)
	public ModelAndView myPage2(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("member/myPage2");
		
		return mav;
	}
	
}
