package com.hicamper.test.web.members.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
	
	@RequestMapping(value="/error/400", method={RequestMethod.POST, RequestMethod.GET}) 
	public String error400() {
		
		return "common/error/error-400";
	}
	
	@RequestMapping(value="/error/403", method={RequestMethod.POST, RequestMethod.GET}) 
	public String error403() {
		
		return "common/error/error-403";
	}
	
	
	@RequestMapping(value="/error/404", method={RequestMethod.POST, RequestMethod.GET}) 
	public String error404() {
		
		return "common/error/error-404";
	}
	
	@RequestMapping(value="/error/500", method={RequestMethod.POST, RequestMethod.GET}) 
	public String error500() {
		
		return "common/error/error-500";
	}
}
