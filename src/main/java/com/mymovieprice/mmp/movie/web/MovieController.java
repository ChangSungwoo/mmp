package com.mymovieprice.mmp.movie.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import com.mymovieprice.mmp.movie.model.DaumMovie;
import com.mymovieprice.mmp.movie.model.DaumSearch;
import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.movie.model.MovieImage;
import com.mymovieprice.mmp.movie.model.MovieImageCondition;
import com.mymovieprice.mmp.movie.model.MovieMaster;
import com.mymovieprice.mmp.movie.service.MovieService;
import com.mymovieprice.mmp.util.StringUtils;
import com.mymovieprice.mmp.common.service.CommonService;
import com.mymovieprice.mmp.common.web.MMPExceptionHandler;



/**
 * <pre>
 * 클래스명 : com.mymovieprice.mmp.movie.web.MovieController.java
 * 기능요약 : 영화정보 처리용 Controller
 * 생성일 : 2016. 03. 11.
 * </pre>
 */

@Controller
public class MovieController {
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Resource(name="movieService")
    private MovieService movieService;
	
	@Resource(name="commonService")
    private CommonService commonService;
	

		
	@RequestMapping(value = "/admin/movie/movieList", method = {RequestMethod.GET, RequestMethod.POST})
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMovieList(Map<String,Object> condition, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_list");
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
			list = movieService.getMovieList(condition , pageNo , rowPerPage);
			
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
			throw new MMPExceptionHandler("영화 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieList");
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/movieDetail", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMovieDetail(Map<String,Object> condition, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_detail");
		List<Map<String, Object>> list;
		
		MovieMaster movieInfo = new MovieMaster();
		
		String movieID = request.getParameter("movieId");
		condition.put("mSeq", 1);
		condition.put("movieId", movieID);
		
		try {
			list = commonService.getDetailUseList(condition);
			movieInfo = movieService.getMovieInfo(condition);
			
			mav.addObject("list", list);
			mav.addObject("movie", movieInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("영화 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieList");
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/createMovie", method = RequestMethod.GET)
	public ModelAndView adminMovieAdd(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_create");
		List<Map<String, Object>> list;
		
		condition.put("mSeq", 1);
		
		try {
			list = commonService.getDetailUseList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("영화 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieList");
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/movieSave")
	@ResponseBody
	public Map<String, Object> adminMovieSave(Map<String,Object> condition, HttpServletRequest request) {
		
		String endYn = StringUtils.nvl(request.getParameter("endYn"), "N") ;
		String displayYn = StringUtils.nvl(request.getParameter("displayYn"),"N");
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!("").equals(WorkerId)) {
			
			MovieCondition movieCondition = new MovieCondition();
				
			movieCondition.setMovieKorTitle(request.getParameter("movieTitle"));
			movieCondition.setMovieEngTitle(request.getParameter("movieEngTitle"));
			movieCondition.setReleaseDt(request.getParameter("releaseDt"));
			movieCondition.setEndYn(endYn);
			movieCondition.setDisplayYn(displayYn);
			movieCondition.setDirectorText(request.getParameter("directorText"));
			movieCondition.setActorText(request.getParameter("actorText"));
			movieCondition.setCreId(WorkerId);
			movieCondition.setUpdId(WorkerId);
			
			
			try {
				map = movieService.addMovieMaster(movieCondition);

			} catch (Exception e) {

				map.put("error",e.getMessage());
				map.put("message","영화정보 저장에 실패하였습니다.");
				e.printStackTrace();
			}			
		}
		return map;
	}
	
	@RequestMapping(value = "/admin/movie/movieModifySave")
	@ResponseBody
	public Map<String, Object> adminMovieModifySave(Map<String,Object> condition, HttpServletRequest request) {
		
		
		// 새로 추가되는 값 검증
		logger.info("endYn : "+request.getParameter("endYn"));
		logger.info("displayYn : "+request.getParameter("displayYn"));
		logger.info("stdPriceDiv : "+request.getParameter("stdPriceDiv"));
		logger.info("creDt : "+request.getParameter("creDt"));
		logger.info("movieId : "+request.getParameter("movieId"));
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!("").equals(WorkerId)) {
			
			MovieCondition movieCondition = new MovieCondition();
				
			movieCondition.setMovieKorTitle(request.getParameter("movieTitle"));
			movieCondition.setMovieEngTitle(request.getParameter("movieEngTitle"));
			movieCondition.setReleaseDt(request.getParameter("releaseDt"));
			movieCondition.setEndYn(request.getParameter("endYn"));
			movieCondition.setDisplayYn(request.getParameter("displayYn"));
			movieCondition.setDirectorText(request.getParameter("directorText"));
			movieCondition.setActorText(request.getParameter("actorText"));
			movieCondition.setStdPriceDiv(request.getParameter("stdPriceDiv"));
			movieCondition.setCreDt(request.getParameter("creDt"));
			movieCondition.setUpdId(WorkerId);
			movieCondition.setMovieId(request.getParameter("movieId"));
					
			
			
			try {
				map = movieService.editMovieMaster(movieCondition);
				//map = null;

			} catch (Exception e) {

				map.put("error",e.getMessage());
				map.put("message","영화정보 저장에 실패하였습니다.");
				e.printStackTrace();
			}			
		}
		return map;
	}
	
	@RequestMapping(value = "/admin/movie/movieImageList", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMovieImageList(Map<String,Object> condition) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_image_list");
		List<Map<String, Object>> list;
		
		try {
			list = movieService.getMovieImageList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
			
		}
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/manageMovieImage", method = RequestMethod.GET)
	public ModelAndView adminMovieImageAdd(Map<String,Object> condition, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/movie/manage_movie_image");
		List<Map<String, Object>> list;
		MovieMaster movieInfo = new MovieMaster();
		String movieID = null;
		
		movieID = request.getParameter("movieId");
		//logger.info("Parameter Movie_ID : "+movieID);
		condition.put("movieId", movieID);
		condition.put("admin", "true");
		
		try {
			movieInfo = movieService.getMovieInfo(condition);
			//logger.info("MovieInfo Title : "+movieInfo.getMovieKorTitle());
			
			list = movieService.getOneMovieImageList(condition);
			//logger.info("ImageList Size : "+list.size());
			
			mav.addObject("list", list);
			mav.addObject("movie", movieInfo);
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/movieImageUpload" , method=RequestMethod.POST)
	public String adminMovieImageUpload(HttpServletRequest request , @ModelAttribute("uploadForm") MovieImage uploadForm) {
		
		MultipartFile file = uploadForm.getFile();
		
		String useYn = StringUtils.nvl(uploadForm.getUseYn(), "Y") ;		//사용여부는 기본으로 사용으로 Y
		String delegateYn = StringUtils.nvl(uploadForm.getDelegateYn(),"N"); //대표이미지 여부는 기본으로 대표이미지 아님.N
		String MovieID = uploadForm.getMovieId();
		
		//ModelAndView mav = new ModelAndView();
		String viewPage = "redirect:/admin/movie/manageMovieImage?movieId="+MovieID;
		logger.info("upload 이후 이동 페이지 : "+viewPage);
		
		String strOriginFileName = file.getOriginalFilename();
		String strUploadFileNm = null;
		
		//TODO WorkerIdv Session 처리
			HttpSession session = request.getSession(true);
			
			String WorkerId = (String)session.getAttribute("member.userNo");
		
		//이미지 업로드 경로.. 폴더당 MovieID 300개..최대 3000개 이내의 이미지가 올라갈 듯...
		int iMovieCnt = 300;
		int iMovieID = Integer.parseInt(MovieID);
		int iNum = 0;
		String strFilePath = null;
		
		iNum = iMovieID/iMovieCnt;
		
		strFilePath = String.valueOf(iNum+1);
		//String strRealPath = "/Users/poppoya/git/mmp/src/main/webapp/WEB-INF/resources/uploadImg/"+strFilePath;
		String strRealPath = "/home/hosting_users/msc/tomcat/webapps/ROOT/WEB-INF/resources/uploadImg/"+strFilePath;
		String strViewPath = "/uploadImg/"+strFilePath;
		
		
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
		
		MovieImageCondition movieImgCondition = new MovieImageCondition();
		
		if(file != null) {
			movieImgCondition.setMovieId(MovieID);
			movieImgCondition.setImageDiv(uploadForm.getImageDiv());
			movieImgCondition.setFileNm(strUploadFileNm);
			movieImgCondition.setFilePath(strViewPath);
			movieImgCondition.setImageDesc(uploadForm.getImageDesc());
			movieImgCondition.setUseYn(useYn);
			movieImgCondition.setDelegateYn(delegateYn);
			
		} 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = movieService.addMovieImage(movieImgCondition);
			
		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화정보 저장에 실패하였습니다.");
			e.printStackTrace();
			throw new MMPExceptionHandler("영화 이미지 목록 업로드중에 에러가 발생하였습니다.","100", "/admin/movie/movieImageList");
		}
		
		return viewPage;
		//return "admin/movie/manage_movie_image";
	}
	
	@RequestMapping(value = "/admin/movie/movieImageModify" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminMovieImageUpdate(Map<String,Object> condition, HttpServletRequest request) {
		
		String delegateYn = StringUtils.nvl(request.getParameter("editDelegateYn"),"N");
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		String strMovieId = request.getParameter("movieId");
		
		MovieImageCondition movieImgCondition = new MovieImageCondition();
		MovieImageCondition tmpMovieImgCondition = new MovieImageCondition();	// 대표 이미지 초기화
		

		movieImgCondition.setMovieId(strMovieId);
		movieImgCondition.setImageSeq(request.getParameter("imageSeq"));
		movieImgCondition.setImageDiv(request.getParameter("editImageDiv"));
		movieImgCondition.setImageDesc(request.getParameter("editImageDesc"));
		movieImgCondition.setDelegateYn(delegateYn);
		movieImgCondition.setUpdId(WorkerId);
		
				
		Map<String, Object> map = new HashMap<String, Object>();
		int disableDelegateCnt = 0;
		
		try {
			if(delegateYn.equals("Y")) {
				tmpMovieImgCondition.setMovieId(strMovieId);
				tmpMovieImgCondition.setUpdId(WorkerId);
				disableDelegateCnt = movieService.disableDelegateMovie(tmpMovieImgCondition);
			}
			map = movieService.modifyMovieImage(movieImgCondition);

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화정보 저장에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping(value = "/admin/movie/movieImageDelete" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminMovieImageDelete(Map<String,Object> condition, HttpServletRequest request) {
		
		//TODO WorkerIdv Session 처리
		HttpSession session = request.getSession(true);
		
		String WorkerId = (String)session.getAttribute("member.userNo");
		String strMovieId = request.getParameter("movieId");
		
		MovieImageCondition movieImgCondition = new MovieImageCondition();

		movieImgCondition.setMovieId(strMovieId);
		movieImgCondition.setImageSeq(request.getParameter("imageSeq"));
		movieImgCondition.setUseYn("N");
		movieImgCondition.setUpdId(WorkerId);
		
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {

			map = movieService.deleteMovieImage(movieImgCondition);

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화 이미지 삭제에 실패하였습니다.");
			e.printStackTrace();
		}
		
		return map;
	}
	

	
	@RequestMapping(value = "/admin/movie/movieDSearch", method = RequestMethod.GET)
	public ModelAndView adminMovieSerarchTest(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_daum_search");
		
		return mav;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/admin/movie/movieDSearchProc", method = RequestMethod.POST)
	@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMovieSerarchProc(Map<String,Object> condition , HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_DSearchResult");
		
		String keyWord = request.getParameter("query");
		keyWord = URLEncoder.encode(keyWord);
		
		logger.info("keyWord : "+keyWord);
		String apiKey = "ed7ab1d68a4dad3a0f93763de66db28b";
		String dUrl = "https://apis.daum.net/contents/movie";
		String keyword = "?apikey="+apiKey+"&q="+keyWord+"&output=xml";
		String sUrl= dUrl+keyword;
		
		
		String strDirectorList = "";
		String strActorList = "";
		
		logger.info("sUrl : "+sUrl);
		
		DocumentBuilderFactory dbf = null;
		DocumentBuilder db = null;
		Document doc = null;
		
		DaumSearch dSearch = new DaumSearch();
		
		
		try {

			URL url = new URL(sUrl);
			URLConnection conn = url.openConnection();
			
			dbf = DocumentBuilderFactory.newInstance();
			db = dbf.newDocumentBuilder();
			doc = db.parse(conn.getInputStream());
			
			Node node = doc.getElementsByTagName("channel").item(0);
			logger.info("count : "+node.getChildNodes().getLength());
			
			
			
			for (int i=0 ;i< node.getChildNodes().getLength();i++) {
				Node channelNode = node.getChildNodes().item(i);
				logger.info("전문 : "+channelNode.getTextContent());
				String nodeName = channelNode.getNodeName();
				if ("title".equals(nodeName))
					dSearch.setTitle(channelNode.getTextContent());
				else if ("generator".equals(nodeName))
					dSearch.setGenerator(channelNode.getTextContent());
				else if ("totalCount".equals(nodeName))
					dSearch.setTotalCount(Integer.parseInt(channelNode.getTextContent()));
				else if ("pageCount".equals(nodeName))
					dSearch.setPageCount(Integer.parseInt(channelNode.getTextContent()));
				else if ("result".equals(nodeName))
					dSearch.setResult(Integer.parseInt(channelNode.getTextContent()));
				else if ("item".equals(nodeName)) 
				{
					//item노드를 객체화 하기
					DaumMovie dMovie = new DaumMovie();
					String tempDir = ""; 
					String tempAct = "";
					
					logger.info("itemNode count : "+channelNode.getChildNodes().getLength());
					
					for (int j=0 ;j< channelNode.getChildNodes().getLength();j++) {
						Node itemNode = channelNode.getChildNodes().item(j);
						
						if("title".equals(itemNode.getNodeName())) {
							dMovie.setTitle(itemNode.getChildNodes().item(1).getTextContent());
							dMovie.setLink(itemNode.getChildNodes().item(3).getTextContent());
						}
						else if("eng_title".equals(itemNode.getNodeName()))
							dMovie.setEngTitle(itemNode.getTextContent());
						else if("link".equals(itemNode.getNodeName()))
							dMovie.setLink(itemNode.getTextContent());
						else if("director".equals(itemNode.getNodeName())) {
							
							for (int t=0 ; t< itemNode.getChildNodes().getLength();t++) {
								
								tempDir = itemNode.getChildNodes().item(t).getTextContent().trim();
								
								if("content".equals(itemNode.getChildNodes().item(t).getNodeName())) {
									strDirectorList += tempDir+",";
								}
								tempDir = "";
							}
							
							strDirectorList = strDirectorList.substring(0, (strDirectorList.length())-1);
							dMovie.setDirector(strDirectorList);
							
							strDirectorList = "";
						}
								
						else if("actor".equals(itemNode.getNodeName())) {
							//dMovie.setActor(itemNode.getChildNodes().item(1).getTextContent());
							for (int t=0 ; t< itemNode.getChildNodes().getLength();t++) {
								
								tempAct = itemNode.getChildNodes().item(t).getTextContent().trim();
								
								if("content".equals(itemNode.getChildNodes().item(t).getNodeName())) {
									strActorList += tempAct+",";
								}
								tempAct = "";
							}
							
							strActorList = strActorList.substring(0, (strActorList.length())-1);
							dMovie.setActor(strActorList);
							
							strActorList = "";

						}
						else if("ogr_title".equals(itemNode.getNodeName()))
							dMovie.setOgrTitle(itemNode.getTextContent());
						else if("open_info".equals(itemNode.getNodeName()))
							dMovie.setOpenInfo(itemNode.getChildNodes().item(1).getTextContent());
					}
					dSearch.getItems().add(dMovie);
				}
			}
			
		} catch (ClientProtocolException e1) {
			e1.printStackTrace();
			throw new MMPExceptionHandler("다음 영화 검색중 조회중에 에러가 발생하였습니다.1","100", "/movie/movieList");
		} catch (IOException e1) {

			e1.printStackTrace();
			throw new MMPExceptionHandler("다음 영화 검색중 조회중에 에러가 발생하였습니다.2","200", "/movie/movieList");
		} catch (ParserConfigurationException e) {

			e.printStackTrace();
			throw new MMPExceptionHandler("다음 영화 검색중 조회중에 에러가 발생하였습니다.3","300", "/movie/movieList");
		} catch (SAXException e) {

			e.printStackTrace();
			throw new MMPExceptionHandler("다음 영화 검색중 조회중에 에러가 발생하였습니다.4","400", "/movie/movieList");
		} catch (Exception e) {

			e.printStackTrace();
			throw new MMPExceptionHandler("다음 영화 검색중 조회중에 에러가 발생하였습니다.5","500", "/movie/movieList");
		}
		
		mav.addObject("dSearch", dSearch);
		
			
			
		mav.addObject("list", dSearch.getItems());
			
		return mav;
	}	
	
	@SuppressWarnings("null")
	public Map<String , Object> searchDaum() {

		Map<String, Object> map = new HashMap<String, Object>();
		
		String apiKey = "ed7ab1d68a4dad3a0f93763de66db28b";
		String dUrl = "https://apis.daum.net/contents/movie";
		String keyword = "?apikey="+apiKey+"&q=미션";
		String sUrl= dUrl+keyword;
		
		DocumentBuilderFactory dbf = null;
		DocumentBuilder db = null;
		Document doc = null;
		
		DaumSearch dSearch = new DaumSearch();
		List<DaumMovie> dMovieList = null;
		
		try {

			URL url = new URL(sUrl);
			URLConnection conn = url.openConnection();
			
			dbf = DocumentBuilderFactory.newInstance();
			db = dbf.newDocumentBuilder();
			doc = db.parse(conn.getInputStream());
			
			Node node = doc.getElementsByTagName("channel").item(0);
			
			for (int i=0 ;i< node.getChildNodes().getLength();i++) {
				Node channelNode = node.getChildNodes().item(i);
				String nodeName = channelNode.getNodeName();
				if ("title".equals(nodeName))
					dSearch.setTitle(channelNode.getTextContent());
				else if ("generator".equals(nodeName))
					dSearch.setGenerator(channelNode.getTextContent());
				else if ("totalCount".equals(nodeName))
					dSearch.setTotalCount(Integer.parseInt(channelNode.getTextContent()));
				else if ("pageCount".equals(nodeName))
					dSearch.setPageCount(Integer.parseInt(channelNode.getTextContent()));
				else if ("result".equals(nodeName))
					dSearch.setResult(Integer.parseInt(channelNode.getTextContent()));
				else if ("item".equals(nodeName)) 
				{
					//item노드를 객체화 하기
					DaumMovie dMovie = new DaumMovie();
					
					for (int j=0 ;j< channelNode.getChildNodes().getLength();j++) {
						Node itemNode = channelNode.getChildNodes().item(j);
						
						if("title".equals(itemNode.getNodeName()))					
							dMovie.setTitle(itemNode.getTextContent());
						else if("eng_title".equals(itemNode.getNodeName()))					
							dMovie.setEngTitle(itemNode.getTextContent().trim());
						else if("link".equals(itemNode.getNodeName()))
							dMovie.setLink(itemNode.getTextContent());
						else if("director".equals(itemNode.getNodeName()))
							dMovie.setDirector(itemNode.getTextContent());
						else if("ogr_title".equals(itemNode.getNodeName()))
							dMovie.setOgrTitle(itemNode.getTextContent());
						else if("open_info".equals(itemNode.getNodeName()))
							dMovie.setOpenInfo(itemNode.getTextContent());
						
					}
					dMovieList.add(dMovie);
				}

				map.put("searchResult",dSearch);
				map.put("list",dMovieList);

			}
			
		} catch (ClientProtocolException e1) {

			e1.printStackTrace();
		} catch (IOException e1) {

			e1.printStackTrace();
		} catch (ParserConfigurationException e) {

			e.printStackTrace();
		} catch (SAXException e) {

			e.printStackTrace();
		}
		
		return map;
	}

}
