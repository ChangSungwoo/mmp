package com.mymovieprice.mmp.common.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.common.model.CodeDetail;
import com.mymovieprice.mmp.common.model.CodeMaster;
import com.mymovieprice.mmp.common.service.CommonService;
import com.mymovieprice.mmp.main.web.MainController;
import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.util.StringUtils;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="commonService")
    private CommonService commonService;

	
	@RequestMapping(value = "/admin/common/adminErr", method = RequestMethod.GET)
	public ModelAndView adminError(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/common/admin_error");
		
		return mav;
	}
	
	@RequestMapping(value = "/common/header", method = RequestMethod.GET)
	public ModelAndView frontHeader(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/include/header");
		
		HttpSession session = request.getSession(false);
		
		logger.info("controller check : "+session.getAttribute("member"));
		mav.addObject("loginInfo" , session.getAttribute("member"));
		
		
		return mav;
	}	
	
	@RequestMapping(value = "/admin/common/commonCodeList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminCommonCodeList(Map<String,Object> condition, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("admin/common/common_code_list");
		List<Map<String, Object>> list;
		
		int pageNo = 1;
		int totalCount = 0;
		int totalPage = 0;
		int rowPerPage = 10;
		
		String strPageNo = "";
		
		strPageNo = StringUtils.nvl(request.getParameter("pageNo"));

		if(("").equals(strPageNo)) {
			strPageNo = "1";
		}
		
		pageNo = Integer.valueOf(strPageNo);
		
		try {
			list = commonService.getCommonCodeMasterList(condition, pageNo, rowPerPage);
			
			if(list.size() > 0) {
				totalCount = Integer.valueOf(list.get(0).get("totalCount").toString());
				totalPage = totalCount / rowPerPage;
			} else {
				totalCount = 0;
				totalPage = 0;
			}
			
			
			
			mav.addObject("list", list);
			mav.addObject("totalCount", totalCount);
			mav.addObject("totalPage", totalPage+1);
			mav.addObject("pageNo", strPageNo);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("공통코드 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieList");
			
		}
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/admin/common/commonCodeMasterSave")
	@ResponseBody
	public Map<String, Object> adminCommonCodeSave(Map<String,Object> condition, HttpServletRequest request) {
		
		String useYn = "Y";
		String strCodeMasterNm = request.getParameter("masterCodeNm");
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!("").equals(WorkerId)) {
			
			CodeMaster codeCondition = new CodeMaster();
				
			codeCondition.setCodeMNm(strCodeMasterNm);
			codeCondition.setUseYn(useYn);
			codeCondition.setCreId(WorkerId);
			codeCondition.setUpdId(WorkerId);
			
			
			try {
				map = commonService.addCommonCodeMaster(codeCondition);

			} catch (Exception e) {

				map.put("error",e.getMessage());
				map.put("message","공통코드 정보 저장에 실패하였습니다.");
				e.printStackTrace();
			}			
		}
		return map;
	}
	
	
	
	
	@RequestMapping(value = "/admin/common/commonCodeDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminCommonCodeDetail(Map<String,Object> condition, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("admin/common/common_code_detail");
		List<Map<String, Object>> list;
		CodeMaster codeMaster = new CodeMaster();
		
		
		int pageNo = 1;
		int totalCount = 0;
		int totalPage = 0;
		int rowPerPage = 100;
		
		String strPageNo = "";
		String strCodeMSeq = request.getParameter("masterCodeNo");
		
		strPageNo = StringUtils.nvl(request.getParameter("pageNo"));

		if(("").equals(strPageNo)) {
			strPageNo = "1";
		}
		
		pageNo = Integer.valueOf(strPageNo);
		condition.put("codeMSeq", strCodeMSeq);
		
		try {
			codeMaster = commonService.getCommonCodeMasterOne(condition);
			list = commonService.getCommonCodeDetailList(condition, pageNo, rowPerPage);
			
			if(list.size() > 0) {
				totalCount = Integer.valueOf(list.get(0).get("totalCount").toString());
				totalPage = totalCount / rowPerPage;
			} else {
				totalCount = 0;
				totalPage = 0;
			}
			
			
			
			mav.addObject("list", list);
			mav.addObject("codeM",codeMaster);
			mav.addObject("totalCount", totalCount);
			mav.addObject("totalPage", totalPage+1);
			mav.addObject("pageNo", strPageNo);

		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("공통코드 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieList");
			
		}
		
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/common/commonCodeDetailSave")
	@ResponseBody
	public Map<String, Object> adminCommonCodeDetailSave(Map<String,Object> condition, HttpServletRequest request) {
		
		String useYn = "Y";
		String strCodeDetailNm = request.getParameter("detailCodeNm");
		String strCodeMSeq = request.getParameter("masterCode");
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!("").equals(WorkerId)) {
			
			CodeDetail codeCondition = new CodeDetail();
				
			codeCondition.setCodeMSeq(strCodeMSeq);
			codeCondition.setCodeDNm(strCodeDetailNm);
			codeCondition.setUseYn(useYn);
			codeCondition.setCreId(WorkerId);
			codeCondition.setUpdId(WorkerId);
			
			
			try {
				map = commonService.addCommonCodeDetail(codeCondition);

			} catch (Exception e) {

				map.put("error",e.getMessage());
				map.put("message","공통코드 상세 정보 저장에 실패하였습니다.");
				e.printStackTrace();
			}			
		}
		return map;
	}
}
