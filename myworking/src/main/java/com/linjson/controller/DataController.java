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
import com.linjson.biz.WorkingBiz;
import com.linjson.util.ConfigUtil;
import com.linjson.util.MapUtil;

@SuppressWarnings({ "rawtypes", "unchecked" })
@RequestMapping("/data")
@Controller
public class DataController extends BaseController {

	@Autowired
	ProjectsBiz projectsBiz;
	@Autowired
	WorkingBiz workingBiz;

	@ResponseBody
	@RequestMapping(value = "/projectlist", method = RequestMethod.GET)
	public HashMap projectlist(String key) {
		return success(projectsBiz.selectProject(key));
	}

	@ResponseBody
	@RequestMapping(value = "/workinglistByPid", method = RequestMethod.GET)
	public HashMap workinglistByPid(String pid, int pageindex, int pagesize) {
		HashMap data = new HashMap();
		data.put("data", workingBiz.selectWorkingList(pid, pageindex, pagesize));
		data.put("total", workingBiz.selectWorkingCount(pid));
		return success(data);
	}

	@ResponseBody
	@RequestMapping(value = "/workingCount", method = RequestMethod.GET)
	public HashMap workingCount() {
		HashMap data = new HashMap();
		data.put("week", workingBiz.countWeek());
		data.put("month", workingBiz.countMonth());
		data.put("all", workingBiz.countAll());

		return success(data);
	}

	@ResponseBody
	@RequestMapping(value = "/addWorking", method = RequestMethod.GET)
	public HashMap workingCount(String pid, String content, String createtime,
			String worktime, String worktype) {
		int result = workingBiz.addWorking(pid, content, createtime, worktime,
				worktype);
		if (result > 0) {
			return success();
		} else {
			return fail("添加失败");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/getProjectById", method = RequestMethod.GET)
	public HashMap getProjectById(String id) {
		return success(projectsBiz.selectProjectById(id));
	}

	@ResponseBody
	@RequestMapping(value = "/updateWorking", method = RequestMethod.GET)
	public HashMap updateWorking(String id, String content, String createtime,
			String worktime, String worktype) {
		int result = workingBiz.updateWorking(id, content, createtime,
				worktime, worktype);
		if (result > 0) {
			return success();
		} else {
			return fail("更新失败");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/deleteWorking", method = RequestMethod.GET)
	public HashMap deleteWorking(String id) {
		int result = workingBiz.deleteWorking(id);
		if (result > 0) {
			return success();
		} else {
			return fail("删除失败");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/a", method = RequestMethod.POST)
	public HashMap a(String[] id) {
		for (int i = 0; i < id.length; i++) {
			System.out.println(id[i]);			
		}

		String t=StringUtils.join(id,"-");
		return success(t);

	}
	
	@ResponseBody
	@RequestMapping(value = "/b", method = RequestMethod.GET)
	public HashMap b(String t) {
		return success(t);

	}

}
