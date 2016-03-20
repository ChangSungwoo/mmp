package com.mymovieprice.mmp.test.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mymovieprice.mmp.test.service.TestService;


@Controller
public class testController {
	
	@Resource(name="testService")
    private TestService testService;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test(Map<String,Object> condition) {
		ModelAndView mav = new ModelAndView("test/test");
		
		List<Map<String, Object>> list;
		
		try {
			list = testService.getUserList(condition);
			mav.addObject("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
		
	}
}
