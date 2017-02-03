package com.linjson.biz;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linjson.dao.ProjectsMapper;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Service
public class ProjectsBiz {

	@Autowired
	public ProjectsMapper mapper;

	public List<HashMap> selectProject(String key) {

		HashMap map=new HashMap();
		map.put("key", key);
		
		return mapper.selectProject(map);

	}
	
	public HashMap selectProjectById(String key) {

		HashMap map=new HashMap();
		map.put("key", key);
		
		return mapper.selectProjectById(map);

	}
	
	

}
