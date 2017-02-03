package com.linjson.dao;

import java.util.HashMap;
import java.util.List;

@SuppressWarnings("rawtypes")
public interface WorkingMapper {

	public List<HashMap> selectWorkingList(HashMap map);
	
	public HashMap countWeek();
	
	public HashMap countMonth();
	
	public HashMap countAll();
	
	public int addWorking(HashMap map);
	
	public int selectWorkingCount(HashMap map);
	
	public int updateWorking(HashMap map);
	
	public int deleteWorking(HashMap map);
}