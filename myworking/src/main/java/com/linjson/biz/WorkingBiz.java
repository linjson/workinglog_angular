package com.linjson.biz;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linjson.dao.WorkingMapper;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Service
public class WorkingBiz {

	@Autowired
	public WorkingMapper mapper;

	public List<HashMap> selectWorkingList(String pid, int pageindex,
			int pagesize) {

		HashMap map = new HashMap();
		map.put("pid", pid);
		map.put("pagesize",pagesize);
		map.put("pageindex",  (pageindex-1)*pagesize);
		return mapper.selectWorkingList(map);

	}

	public List<HashMap> selectWorkingList(String pid) {

		HashMap map = new HashMap();
		map.put("pid", pid);
		map.put("pagesize", 10);
		map.put("pageindex", 0);
		return mapper.selectWorkingList(map);

	}

	public HashMap countWeek() {

		return mapper.countWeek();
	}

	public HashMap countMonth() {

		return mapper.countMonth();
	}

	public HashMap countAll() {

		return mapper.countAll();
	}

	public int addWorking(String pid, String content, String createtime,
			String worktime, String worktype) {
		double w = NumberUtils.toDouble(worktime, 0);
		HashMap map = new HashMap();
		map.put("pid", pid);
		map.put("content", content);
		map.put("createtime", createtime);
		map.put("worktime", w);
		map.put("worktype", worktype);

		return mapper.addWorking(map);
	}
	
	public int selectWorkingCount(String pid){
		HashMap map = new HashMap();
		map.put("pid", pid);
		return mapper.selectWorkingCount(map);
	}
	
	public int updateWorking(String id, String content, String createtime,
			String worktime, String worktype) {
		double w = NumberUtils.toDouble(worktime, 0);
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("content", content);
		map.put("createtime", createtime);
		map.put("worktime", w);
		map.put("worktype", worktype);

		return mapper.updateWorking(map);
	}
	
	public int deleteWorking(String id){
		HashMap map = new HashMap();
		map.put("id", id);
		return mapper.deleteWorking(map);
	}
	
}
