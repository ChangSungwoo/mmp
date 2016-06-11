package com.mymovieprice.mmp.common.web;

import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mymovieprice.mmp.main.web.MainController;
import com.mymovieprice.mmp.member.model.Member;
import com.mymovieprice.mmp.util.StringUtils;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter  {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String returnUrl = request.getRequestURI();
		int intAdminCheck = StringUtils.cntInStr(returnUrl, "/admin/");
		
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			response.sendRedirect("/member/login?returnUrl="+returnUrl);
			return false;
		}
		
		Member member = (Member)session.getAttribute("member");
		
		if(member == null) {
			response.sendRedirect("/member/login?returnUrl="+returnUrl);
			return false;
		} else {
			if(intAdminCheck > 0) {
				logger.info("interceptor session check : "+session.getAttribute("member.userGrade"));
				if(session.getAttribute("member.userGrade").equals("0")) {

				} else {
					logger.info("admin 권한없는 작자가 직접접근시 차단");
					session.invalidate();
					response.sendRedirect("/member/login");
					return false;
				}
			} else {
				
			}
		}
		
		return true;
	}
	
	@SuppressWarnings("unused")
	private String getRequestedUri(HttpServletRequest request) {
		// FIXME : URI 정보 추출 방법 확인 필요. 어디서 부터 substring 할지.
		String requestedUri = request.getRequestURI().substring(request.getContextPath().length());
		int colonIndex = requestedUri.indexOf(";");
		if (colonIndex > -1) {
			requestedUri = requestedUri.substring(0, colonIndex);
		}

		return requestedUri;
	}

	
	
}
