package com.mymovieprice.mmp.reader.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.jsoup.*;

import com.mymovieprice.mmp.common.service.CommonService;
import com.mymovieprice.mmp.common.web.MMPExceptionHandler;
import com.mymovieprice.mmp.movie.model.MovieImage;
import com.mymovieprice.mmp.reader.model.ReaderCondition;
import com.mymovieprice.mmp.reader.model.ReaderMaster;
import com.mymovieprice.mmp.reader.service.ReaderService;

@Controller
public class ReaderController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReaderController.class);
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	@Resource(name="readerService")
    private ReaderService readerService;
	
	@RequestMapping(value = "/reader/readerList", method = RequestMethod.GET)
	public ModelAndView columnList(Map<String,Object> condition) {
		
		List<Map<String, Object>> list;
		
		ModelAndView mav = new ModelAndView("reader/reader_list");
		int i = 0;
		String tempVal = "";
		
		try {
			list = readerService.getFrontReaderList(condition);
			
			i = list.size();
			
			for(int j = 0;j < i;j++) {
				logger.info("readerContent : "+list.get(j).get("readerContent"));
				//logger.info("readerContent : "+Jsoup.parse(list.get(j).get("readerContent").toString()).text());
				tempVal = Jsoup.parse(list.get(j).get("readerContent").toString()).text();
				list.get(j).put("rpcContent", tempVal);

			}
			
			mav.addObject("list", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","200", "/movie/movieList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/reader/readerDetail", method = RequestMethod.GET)
	public ModelAndView columnDetail(Map<String,Object> condition, HttpServletRequest request) {
		
		ReaderMaster readerMaster = new ReaderMaster();
		ModelAndView mav = new ModelAndView("reader/reader_detail");
		
		String readerSeq = request.getParameter("readerSeq");
		
		condition.put("readerSeq", readerSeq);
		
		try {
			
			readerMaster = readerService.getReaderInfo(condition);

			mav.addObject("reader", readerMaster);

		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
		}
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/admin/reader/readerList", method = RequestMethod.GET)
	public ModelAndView adminReaderList(Map<String,Object> condition) {
		ModelAndView mav = new ModelAndView("admin/reader/reader_list");
		List<Map<String, Object>> list;
		
		try {
			list = readerService.getReaderList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("영화 목록 조회중에 에러가 발생하였습니다.","100", "/admin/reader/readerList");
			
		}
		
		
		return mav;
	}

	@RequestMapping(value = "/admin/reader/readerCreate", method = RequestMethod.GET)
	public ModelAndView adminReaderCreate(Map<String,Object> condition) {
		ModelAndView mav = new ModelAndView("admin/reader/reader_create");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/reader/readerSave")
	@ResponseBody
	public Map<String, Object> adminReaderSave(Map<String,Object> condition, HttpServletRequest request) {
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		String WorkerId = (String)session.getAttribute("member.userNo");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		/*
		String strReaderDiv = "1";
		
		if(request.getParameter("movieUrl").equals(null) || request.getParameter("movieUrl").equals("")) {
			strReaderDiv = "1";
		} else {
			strReaderDiv = "2";
		}
		
		*/ 
		
		if(!("").equals(WorkerId)) {
			
			ReaderCondition readerCondition = new ReaderCondition();
				
			readerCondition.setReaderTitle(request.getParameter("readerTitle"));
			readerCondition.setReaderContent(request.getParameter("ir1"));
			
			logger.info("Text : "+request.getParameter("ir1"));
			
			
			readerCondition.setReaderDiv(request.getParameter("readerDiv"));
			readerCondition.setUseYn(request.getParameter("useYn"));
			readerCondition.setMovieUrl(request.getParameter("movieUrl"));
			readerCondition.setDelegateImgSeq(request.getParameter("delegateImgUrl"));
			readerCondition.setCreId(WorkerId);
			readerCondition.setUpdId(WorkerId);
			
			
			try {
				map = readerService.addReaderMaster(readerCondition);

			} catch (Exception e) {

				map.put("error",e.getMessage());
				map.put("message","읽을거리 저장에 실패하였습니다.");
				e.printStackTrace();
			}			
		}
		return map;
	}
	
	@RequestMapping(value = "/admin/reader/readerDetail", method = RequestMethod.GET)
	public ModelAndView adminReaderDetail(Map<String,Object> condition, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/reader/reader_detail");
		
		ReaderMaster readerInfo = new ReaderMaster();
		String readerSeq = request.getParameter("readerSeq");
		logger.info("aaaa : "+readerInfo.getReaderTitle());
		
		condition.put("readerSeq", readerSeq);
		
		try {
			readerInfo = readerService.getReaderInfo(condition);
			
			mav.addObject("reader", readerInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("읽을거리 목록 조회중에 에러가 발생하였습니다.","100", "/admin/reader/readerList");
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/reader/photoUploader", method = RequestMethod.GET)
	public ModelAndView adminReaderUploadForm(Map<String,Object> condition) {
		ModelAndView mav = new ModelAndView("admin/reader/photo_uploader");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/reader/readerImageUpload" , method=RequestMethod.POST)
	public String adminReaderImageUpload(HttpServletRequest request , @ModelAttribute("editor_upimage") MovieImage uploadForm) {
		
		MultipartFile file = uploadForm.getFile();
		
		String viewPage = "/admin/reader/readerList";
		logger.info("upload 이후 이동 페이지 : "+viewPage);
		
		String strOriginFileName = file.getOriginalFilename();
		String strUploadFileNm = null;
		
		//TODO WorkerIdv Session 처리
			HttpSession session = request.getSession(true);
			
			String WorkerId = (String)session.getAttribute("member.userNo");
		
		//이미지 업로드 경로.. 폴더당 MovieID 300개..최대 3000개 이내의 이미지가 올라갈 듯...

		String strRealPath = "/Users/poppoya/git/mmp/src/main/webapp/WEB-INF/resources/uploadImg/reader/";
		//String strRealPath = "/home/hosting_users/msc/tomcat/webapps/ROOT/WEB-INF/resources/uploadImg/";
		
		
		UUID uid = UUID.randomUUID();
		strUploadFileNm = uid.toString()+"_"+strOriginFileName;
		
		File directory = new File(strRealPath);
		if(!directory.exists()) {
			directory.mkdir();
		}
		
		File nFile = new File(strRealPath+"/"+strUploadFileNm);
		logger.info("upload경로 : "+strRealPath+"/"+strUploadFileNm);
		
		try {
			file.transferTo(nFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		/*
		MovieImageCondition movieImgCondition = new MovieImageCondition();
		
		if(file != null) {
			movieImgCondition.setMovieId(MovieID);
			movieImgCondition.setImageDiv(uploadForm.getImageDiv());
			movieImgCondition.setFileNm(strUploadFileNm);
			movieImgCondition.setFilePath(strViewPath);
			movieImgCondition.setImageDesc(uploadForm.getImageDesc());
			movieImgCondition.setUseYn(useYn);
			movieImgCondition.setDelegateYn(delegateYn);
			
			logger.info("movieID : "+movieImgCondition.getMovieId());
			logger.info("Image Division : "+movieImgCondition.getImageDiv());
			logger.info("File Name : "+movieImgCondition.getFileNm());
			logger.info("File Path : "+movieImgCondition.getFilePath());
			logger.info("Image Description : "+movieImgCondition.getImageDesc());
			logger.info("Use YesOrNo : "+movieImgCondition.getUseYn());
			logger.info("Delegate YesOrNo : "+movieImgCondition.getDelegateYn());
			
		} 
		*/
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			//map = readerService.addReaderArticleImage(movieImgCondition);
			map = null;
			
		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화정보 저장에 실패하였습니다.");
			e.printStackTrace();
			throw new MMPExceptionHandler("영화 이미지 목록 업로드중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
		}
		
		return viewPage;
	}
}
