package com.hicamper.test.etc.evaluation.evaluation;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.hicamper.test.etc.evaluation.evaluation.service.EvaluationService;
import com.hicamper.test.web.members.common.board.service.BoardService;

@Controller
public class EvaluationController {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationController.class);
	
	@Autowired
	EvaluationService service;	
	
	@RequestMapping(value= "/thumbupform", method={RequestMethod.POST, RequestMethod.GET})
	public String thumbupform(Model model) {
		model.addAttribute("idx", "2");
		return "test/testrecomend";		
	}	
	
	@RequestMapping(value= "/thumbup", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String thumbup(Model model, @RequestParam Map map) throws Exception {
		
		int result = service.thumbup(map);
		
		Map post = new HashMap<>();
		post = service.getPost(map);
						
		JsonObject json = new JsonObject();		
		json.addProperty("data", (Integer) post.get("likebtn"));
		
		return new Gson().toJson(json);		
	}
	
	@RequestMapping(value= "/thumbdown", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String thumbdown(Model model, @RequestParam Map map) throws Exception {
		int result = service.thumbdown(map);
					
		Map post = new HashMap<>();
		post = service.getPost(map);
				
		JsonObject json = new JsonObject();		
		json.addProperty("data", (Integer) post.get("dislikebtn"));	
		
		return new Gson().toJson(json);		
	}
	
	@RequestMapping(value= "/rankstarup", method={RequestMethod.POST, RequestMethod.GET})
	public String starup(Model model, @RequestParam Map map) throws Exception {
		int count = service.starup(map);
		return "test/testrecomend";
	}
	
	
}
