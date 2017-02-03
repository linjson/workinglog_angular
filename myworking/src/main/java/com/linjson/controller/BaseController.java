package com.linjson.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;

import com.linjson.util.ConfigUtil;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class BaseController {
	
	protected ConfigUtil configUtil;

	public BaseController() {
	}

	public HashMap writeResult(Object result, String state, String error) {

		HashMap map = new HashMap();

		map.put("result", result);
		map.put("state", state);
		map.put("error", error);

		return map;
	}

	public HashMap success() {
		return writeResult("ok", "success", "");
	}

	public HashMap success(Object obj) {
		if (obj instanceof String) {
			return writeResult(ObjectUtils.toString(obj), "success", "");
		} else {
			return writeResult(obj, "success", "");
		}
	}

	public HashMap fail(String error) {
		return writeResult("", "fail", error);
	}

	protected void setupParam(HashMap map, String key, String s) {
		if (StringUtils.isNotBlank(s)) {
			map.put(key, s);
		}
	}

	protected String getString(String key) {
		ConfigUtil configUtil = new ConfigUtil("system.properties");
		return configUtil.getString(key);
	}

	protected void doJsonp(HttpServletResponse response, String callback, String string){
		ServletOutputStream out;
		try {
			callback = StringUtils.isNotBlank(callback) ? callback
					: "flightHandler";
			out = response.getOutputStream();
			
			out.print(String.format("%s(%s)", callback,string));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
