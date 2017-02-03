package com.linjson.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.linjson.biz.ProjectsBiz;

@SuppressWarnings("rawtypes")
@RequestMapping("/web")
@Controller
public class WebController extends BaseController {
	
	@RequestMapping(value = "/projects", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView view = new ModelAndView("/projects");
		return view;
	}
	

	@RequestMapping(value = "/projects_detail", method = RequestMethod.GET)
	public ModelAndView projectsDetail() {
		ModelAndView view = new ModelAndView("/projects_detail");
		return view;
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test() {
		ModelAndView view = new ModelAndView("/test");
		return view;
	}
}
