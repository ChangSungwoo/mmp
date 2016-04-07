package com.mymovieprice.mmp.common.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {

	
	@RequestMapping(value = "/admin/common/adminErr", method = RequestMethod.GET)
	public ModelAndView adminError(Map<String,Object> condition) {
		
		ModelAndView mav = new ModelAndView("admin/common/admin_error");
		
		return mav;
	}
}
