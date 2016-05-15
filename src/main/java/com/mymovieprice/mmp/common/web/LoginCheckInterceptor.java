package com.mymovieprice.mmp.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mymovieprice.mmp.main.web.MainController;
import com.mymovieprice.mmp.member.model.Member;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter  {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			response.sendRedirect("/member/login");
			return false;
		}
		
		logger.info("inteceptor check : "+session.getAttribute("member"));
		
		Member member = (Member)session.getAttribute("member");
		
		if(member == null) {
			response.sendRedirect("/member/login");
			return false;
		}
		
		return true;
	}

	
	
}
