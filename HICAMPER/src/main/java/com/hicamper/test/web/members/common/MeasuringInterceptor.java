package com.hicamper.test.web.members.common;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MeasuringInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(MeasuringInterceptor.class);
	
	@Autowired
	Overlapping_signup overlapping;
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("Start");
		logger.info("Request URI" + request.getRequestURI());
		
		HttpSession session = request.getSession();
		String id  = (String) session.getAttribute("id");
		
		if("/common/interceptor".equals(request.getRequestURI())) {
			System.out.println("Interceptor Success");
			return true;
		}else if(null == id) {
			System.out.println("Interceptor Fail");
			response.sendRedirect("/common/interceptor");
			return false;
		}
		return true;
	
	}

}

