package com.linjson.dao;

import java.util.HashMap;
import java.util.List;

@SuppressWarnings("rawtypes")
public interface ProjectsMapper {

	public List<HashMap> selectProject(HashMap map);
	
	public HashMap selectProjectById(HashMap map);
	
}