package com.linjson.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.flatbuffers.FlatBufferBuilder;
import com.linjson.flatbuffers.Car;
import com.linjson.flatbuffers.Person;
import com.linjson.flatbuffers.PersonJson;
import com.linjson.flatbuffers.PersonList;

@SuppressWarnings({ "rawtypes", "unchecked" })
@RequestMapping("/test")
@Controller
public class TestController extends BaseController {
	@ResponseBody
	@RequestMapping(value = "/buffer", method = RequestMethod.GET)
	public HashMap test(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/octet-stream");
		OutputStream out = response.getOutputStream();
		
		FlatBufferBuilder fbb = new FlatBufferBuilder();
		int[] list=new int[10];
		for(int i=0;i<list.length;i++){
			int a=fbb.createString("test"+i);
			Person.startPerson(fbb);
			Person.addId(fbb, i);
			Person.addName(fbb, a);
			list[i]=Person.endPerson(fbb);
		}
//		PersonList.startPersonList(fbb);
		
		int v=PersonList.createPVector(fbb, list);
		
		int p=PersonList.createPersonList(fbb,v);
		PersonList.finishPersonListBuffer(fbb, p);
		
////		PersonList.startPersonList(fbb);
//		
////		for(int i=0;i<list.length;i++){
//			int p=PersonList.createListVector(fbb, list);
////		}
		
		
//		int p=PersonList.endPersonList(fbb);
		
		
//		
		PersonList.finishPersonListBuffer(fbb, p);
		
		PersonList test=PersonList.getRootAsPersonList(fbb.dataBuffer());

		for(int i=0;i<test.pLength();i++){
			
			System.out.println(test.p(i).id()+","+test.p(i).name());
			
		}
//		
		out.write(fbb.sizedByteArray());
		
		out.close();
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/text", method = RequestMethod.GET)
	public HashMap text() {
		HashMap map=new HashMap();
		ArrayList<PersonJson> list=new ArrayList();
		for(int i=0;i<10000;i++){
			list.add(new PersonJson(i,"test"));
		}
		
		map.put("p", list);
		return map;
	}
}


