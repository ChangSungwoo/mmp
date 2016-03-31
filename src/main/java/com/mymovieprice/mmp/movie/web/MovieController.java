package com.mymovieprice.mmp.movie.web;

import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import com.mymovieprice.mmp.movie.model.DaumMovie;
import com.mymovieprice.mmp.movie.model.DaumSearch;
import com.mymovieprice.mmp.movie.model.MovieCondition;
import com.mymovieprice.mmp.movie.service.MovieService;
import com.mymovieprice.mmp.util.StringUtils;
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
		
	@RequestMapping(value = "/admin/movie/movieList", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMovieList(Map<String,Object> condition) throws Exception {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_list");
		List<Map<String, Object>> list;
		
		try {
			list = movieService.getMovieList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MMPExceptionHandler("영화 목록 조회중에 에러가 발생하였습니다.","100", "/admin/movie/movieList");
			
		}
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/createMovie", method = RequestMethod.GET)
	public ModelAndView adminMovieAdd(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_create");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/movieSave")
	@ResponseBody
	public Map<String, Object> adminMovieSave(Map<String,Object> condition, HttpServletRequest request) {
		
		String endYn = StringUtils.nvl(request.getParameter("endYn"), "N") ;
		String displayYn = StringUtils.nvl(request.getParameter("displayYn"),"N");
		
		//TODO WorkerIdv Session 처리
		String WorkerId = "SYSTEM";
		
		MovieCondition movieCondition = new MovieCondition();
		
		logger.info("movieTitle : "+request.getParameter("movieTitle"));
		logger.info("releaseDate : "+request.getParameter("releaseDate"));
			
		movieCondition.setMovieKorTitle(request.getParameter("movieTitle"));
		movieCondition.setMovieEngTitle(request.getParameter("movieEngTitle"));
		movieCondition.setReleaseDate(request.getParameter("releaseDate"));
		movieCondition.setEndYn(endYn);
		movieCondition.setDisplayYn(displayYn);
		movieCondition.setCreId(WorkerId);
		movieCondition.setUpdId(WorkerId);
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = movieService.addMovieMaster(movieCondition);

		} catch (Exception e) {

			map.put("error",e.getMessage());
			map.put("message","영화정보 저장에 실패하였습니다.");
			e.printStackTrace();
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
	
	@RequestMapping(value = "/admin/movie/movieDSearch", method = RequestMethod.GET)
	public ModelAndView adminMovieSerarchTest(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_daum_search");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/movie/movieDSearchProc", method = RequestMethod.POST)
	@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView adminMovieSerarchProc(Map<String,Object> condition , HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("admin/movie/movie_DSearchResult");
		
		String keyWord = request.getParameter("query");
		logger.info("keyWord : "+keyWord);
		String apiKey = "ed7ab1d68a4dad3a0f93763de66db28b";
		String dUrl = "https://apis.daum.net/contents/movie";
		String keyword = "?apikey="+apiKey+"&q="+keyWord;
		String sUrl= dUrl+keyword;
		
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
						
						
						if("title".equals(itemNode.getNodeName())) {
							//dMovie.setTitle(itemNode.getTextContent());
							dMovie.setTitle(itemNode.getChildNodes().item(1).getTextContent());
							dMovie.setLink(itemNode.getChildNodes().item(3).getTextContent());
							
							//logger.info("0 - "+itemNode.getChildNodes().item(0).getTextContent());
							//logger.info("1 - "+itemNode.getChildNodes().item(1).getTextContent());
							//logger.info("2 - "+itemNode.getChildNodes().item(3).getTextContent());
						}
						else if("eng_title".equals(itemNode.getNodeName()))
							dMovie.setEngTitle(itemNode.getTextContent());
						else if("link".equals(itemNode.getNodeName()))
							dMovie.setLink(itemNode.getTextContent());
						else if("director".equals(itemNode.getNodeName()))
							dMovie.setDirector(itemNode.getChildNodes().item(1).getTextContent());
						else if("actor".equals(itemNode.getNodeName()))
							dMovie.setActor(itemNode.getChildNodes().item(1).getTextContent());
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
	
	@RequestMapping(value = "/movie/movieList", method = RequestMethod.GET)
	//@ExceptionHandler({MMPExceptionHandler.class})
	public ModelAndView movieList(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("movie/movie_list");
		List<Map<String, Object>> list;
		
		try {
			//list = movieService.getMovieList(condition);
			list = null;
			mav.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			//throw new MMPExceptionHandler("영화 이미지 목록 조회중에 에러가 발생하였습니다.","200", "/movie/movieList");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/movie/movieDetail", method = RequestMethod.GET)
	public ModelAndView movieDetail(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("movie/movie_detail");
		
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
