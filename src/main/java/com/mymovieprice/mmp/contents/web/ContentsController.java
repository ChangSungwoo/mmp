package com.mymovieprice.mmp.contents.web;

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
import com.mymovieprice.mmp.contents.model.ContentMasterCondition;
import com.mymovieprice.mmp.contents.service.ContentsService;
import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.movie.service.MovieService;
import com.mymovieprice.mmp.review.service.ReviewService;
import com.mymovieprice.mmp.util.StringUtils;


/**
 * <pre>
 * 클래스명 : com.mymovieprice.mmp.contents.web.ContentsController.java
 * 기능요약 : 영화정보 처리용 Controller
 * 생성일 : 2016. 03. 11.
 * </pre>
 */

@Controller
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);
	
	@Resource(name="reviewService")
    private ReviewService reviewService;
	
	@Resource(name="contentsService")
    private ContentsService contentsService;
	
	@RequestMapping(value = "/admin/service/mainContentList", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMainContentList(Map<String,Object> condition) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/contents/main_content_list");
		List<Map<String, Object>> list;
		List<Map<String, Object>> mListEditor;
		
		try {
			//list = contentService.getMainContentList(condition);
			mListEditor = reviewService.getReviewListByEditor(condition);
			list = null;
			mav.addObject("list", list);
			mav.addObject("mList1" , mListEditor);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("영화 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieList");
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/service/addMainContentEditorReview", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminAddMainContent(Map<String,Object> condition, HttpServletRequest request) {
		
		String reviewSeq = request.getParameter("reviewSeq");
		
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!("").equals(WorkerId)) {
			
			ContentMasterCondition contentCondition = new ContentMasterCondition();
			
			logger.info("movieTitle : "+request.getParameter("movieTitle"));
			logger.info("releaseDt : "+request.getParameter("releaseDt"));
			logger.info("directorText : "+request.getParameter("directorText"));
			logger.info("actorText : "+request.getParameter("actorText"));
				
			contentCondition.setPageId(request.getParameter("pageId"));
			contentCondition.setContentDiv(request.getParameter("contentDiv"));
			contentCondition.setContentSeq(request.getParameter("reviewSeq"));
			//contentCondition.setImageSeq(request.getParameter("imageSeq"));	imageSeq는 쿼리에서 처리
			contentCondition.setUseYn("Y");
			contentCondition.setDisplayOrder("1");
			contentCondition.setCreId(WorkerId);
			contentCondition.setUpdId(WorkerId);
					
			
			
			try {
				//map = contentsService.addMainContent(contentCondition);
				map = null;

			} catch (Exception e) {

				map.put("error",e.getMessage());
				map.put("message","메인화면 컨텐츠 관리에 실패하였습니다.");
				e.printStackTrace();
			}			
		}
		return map;		
	}
}
