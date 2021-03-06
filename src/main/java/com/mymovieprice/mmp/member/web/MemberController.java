package com.mymovieprice.mmp.member.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.common.web.MMPExceptionHandler;
import com.mymovieprice.mmp.main.web.MainController;
import com.mymovieprice.mmp.member.model.Member;
import com.mymovieprice.mmp.member.model.MemberCondition;
import com.mymovieprice.mmp.member.service.MemberService;
import com.mymovieprice.mmp.review.service.ReviewService;
import com.mymovieprice.mmp.util.StringUtils;

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
	
	@Resource(name="memberService")
    private MemberService memberService;
	
	@Resource(name="reviewService")
    private ReviewService reviewService;
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request) {
		
		String redirectUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort() + request.getAttribute("requestedUri");
		String returnUrl = request.getParameter("returnUrl");
		
		logger.info("returnUrl : "+redirectUrl);
		logger.info("returnUrl2 : "+request.getParameter("returnUrl"));
		
		
		ModelAndView mav = new ModelAndView("member/member_login");
		
		mav.addObject("rtnUrl", returnUrl);
		
		return mav;
	}
	
	@RequestMapping(value = "/member/loginProc")
	@ResponseBody
	public Map<String, Object> memberSaveloginProc(Map<String,Object> condition, HttpServletRequest request) {
	//public String memberSaveloginProc(Map<String,Object> condition, HttpServletRequest request) {
				
		String msg = null;
		String strRsltCode = null;
		
		MemberCondition memberCondition = new MemberCondition();
		//String viewPage = null; //"redirect:/admin/movie/manageMovieImage?movieId="+MovieID
		
		String reqLoginId = request.getParameter("loginId");
		String reqLoginPwd = request.getParameter("loginPwd");
		String returnUrl = request.getParameter("returnUrl");
		int intAdminCheck = StringUtils.cntInStr(returnUrl, "/admin/");
		
		logger.info("returnUrl : "+returnUrl);
		
		String strLoginId = null;
		String strLoginPwd = null;
		String strUserNickNm = null;
		String strUserNo = null;
		String strUserGrade = null;
			
		memberCondition.setLoginId(reqLoginId);
		memberCondition.setLoginPwd(reqLoginPwd);
				
		Map<String, Object> map = new HashMap<String, Object>();
		Member loginMember = new Member();
		
		try {
			loginMember = memberService.getLoginUserInfo(memberCondition);
			
			if(loginMember == null) {
				msg = "ID Not found";
				strRsltCode = "A04";
			} else {
				
				strLoginId = loginMember.getLoginId();
				strLoginPwd = loginMember.getLoginPwd();
				strUserNickNm = loginMember.getUserNickNm();
				strUserNo = loginMember.getUserNo();
				strUserGrade = loginMember.getUserGrade();
				
				if(strLoginId.equals(reqLoginId)) {
					if(strLoginPwd.equals(reqLoginPwd)) {
						// 정상 로그인 됨.
						HttpSession session = request.getSession(true);
						session.setAttribute("member", loginMember);
						session.setAttribute("member.userNick", strUserNickNm);
						session.setAttribute("member.userNo", strUserNo);
						session.setAttribute("member.userGrade", strUserGrade);
						
						if(intAdminCheck >0) {
							
							if(strUserGrade.equals("0")) {
								strRsltCode = "A00";		//Admin권한으로 정상 접근
							} else {
								strRsltCode = "A05";		// 권한 없는 사용자가 Admin URL로 접근
								returnUrl = "/";
							}
							
						} else {
							strRsltCode = "A00";			//일반 사용자 권한으로 정상 접근
							returnUrl = "/";
						}
					} else {
						msg = "Password not correct";
						strRsltCode = "A03";
						returnUrl = "member/login";
					}
				}	
			}			

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","로그인 처리중 오류가 발생했습니다.");
			e.printStackTrace();
		}
		
		map.put("resultCode", strRsltCode);
		logger.info("last returnUrl : "+returnUrl);
		map.put("rtnUrl", returnUrl);
		map.put("message", msg);
		
		return map;
		//return viewPage;
	}
	
	@RequestMapping(value = "/member/logOut")
	public ModelAndView memberLogout(Map<String,Object> condition, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("main/main");
		
		HttpSession session = request.getSession(true);
		session.invalidate();
		
		return mav;
	}
	
	@RequestMapping(value = "/member/regist", method = RequestMethod.GET)
	public ModelAndView regist(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("member/member_regist");
		
		return mav;
	}
	
	@RequestMapping(value = "/member/memberSave")
	@ResponseBody
	public Map<String, Object> memberSave(Map<String,Object> condition, HttpServletRequest request) {
				
		//TODO WorkerIdv Session 처리
		String WorkerId = "SYSTEM";
		
		MemberCondition memberCondition = new MemberCondition();
			
		memberCondition.setLoginId(request.getParameter("loginId"));
		memberCondition.setLoginPwd(request.getParameter("loginPwd"));
		memberCondition.setUserNickNm(request.getParameter("userNickNm"));
		logger.info("USerNickName : "+memberCondition.getUserNickNm());
		memberCondition.setUserNm("");			// 당사 직접 가입일 경우 이름 필드는 Null
		memberCondition.setUserType("0");		// 회원 가입 페이지를 통하여 가입된 사용자는 0 ,SNS인증을 통한 미가입 회원은 1
		memberCondition.setProviderCd("0");		// 당사 :  4 , SNS : 5
		memberCondition.setUserGrade("1");		// 관리자 : 0, 일반회원 : 1
		memberCondition.setCreId(WorkerId);
		memberCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = memberService.addMember(memberCondition);

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","회원정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/member/myPage", method = RequestMethod.GET)
	public ModelAndView myPage(Map<String,Object> condition, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("member/myPage");
		
		List<Map<String, Object>> list;
		List<Map<String, Object>> myFavoitrList;
		List<Map<String, Object>> favoriteMeList;
		
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		condition.put("userId", WorkerId);
		
		logger.info("userId : "+WorkerId);
		
		try {
			list = reviewService.getReviewListByOneUser(condition);
			logger.info("list size : "+list.size());
			
			myFavoitrList = memberService.getMyFavoriteUserList(condition);
			favoriteMeList = memberService.getFavoriteMeUserList(condition);
			
			mav.addObject("list", list);
			mav.addObject("reviewCount" , list.size());
			
			mav.addObject("mfList", myFavoitrList);
			mav.addObject("fmList", favoriteMeList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/member/myPage2", method = RequestMethod.GET)
	public ModelAndView myPage2(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("member/myPage2");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/member/memberList", method = RequestMethod.GET)
	public ModelAndView adminMemberList(Map<String,Object> condition, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("admin/member/member_list");
		
		List<Map<String, Object>> list;
		
		condition.put("admin" , "false");
		
		try {
			list = memberService.getMemberList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/member/memberDetail", method = RequestMethod.GET)
	public ModelAndView adminMemberDetail(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/member/member_detail");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/member/memberAdminList", method = RequestMethod.GET)
	public ModelAndView adminMemberAdminList(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/member/member_admin_list");
		
		List<Map<String, Object>> list;
		
		condition.put("admin" , "true");
		
		try {
			list = memberService.getMemberList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			
		}

		return mav;
	}
	
}
