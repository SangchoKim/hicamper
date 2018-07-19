package com.hicamper.test.etc.search.lookup;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hicamper.test.etc.search.filter.Criteria;
import com.hicamper.test.etc.search.filter.PageMaker;
import com.hicamper.test.etc.search.lookup.service.lookUpService;

@Controller
public class lookUpController {

	private static final Logger logger = LoggerFactory.getLogger(lookUpController.class);
	
	@Autowired
	private lookUpService lookupservice;
	
	@RequestMapping(value = "/lookup", method = {RequestMethod.POST, RequestMethod.GET})
	public String lookUpView(Model model, @RequestParam Map filterInfo, HttpServletRequest request) {
		int currentPage = 1;
		int perPageNum = 3;
		int method = 2;
		
		if(request.getParameter("pages") != null) {
			currentPage = Integer.parseInt(request.getParameter("pages").toString());
		}
		
		filterInfo.put("currentPage", currentPage);
		filterInfo.put("perPageNum", perPageNum);		
		Map pageInfo = Criteria.cri(filterInfo);
		int totalCount = lookupservice.countList(filterInfo);
		
		filterInfo.put("totalCount", totalCount);
		Map paging = PageMaker.calcData(filterInfo);
		
		int startPage = Integer.parseInt(paging.get("startPage").toString());
		int endPage = Integer.parseInt(paging.get("endPage").toString());
		int prevPage = Integer.parseInt(paging.get("prevPage").toString());
		int nextPage = Integer.parseInt(paging.get("nextPage").toString());
		boolean next = (boolean) paging.get("next");
		
		Enumeration params = request.getParameterNames();
		String strParam = "";
		while(params.hasMoreElements()) {
		    String name = (String)params.nextElement();
		    String value = request.getParameter(name);
		    if(name.equals("pages"))
		    	break;
		    strParam += name + "=" + value + "&";
		}
		
		Map pageMap = new HashMap();
		pageMap.put("currentPage", currentPage);
		pageMap.put("perPageNum", perPageNum);
		pageMap.put("startPage", startPage);
		pageMap.put("endPage", endPage);
		pageMap.put("prevPage", prevPage);
		pageMap.put("nextPage", nextPage);
		pageMap.put("next", next);
		pageMap.put("strParam", strParam);
		pageMap.put("method", method);
		model.addAttribute("pageMap", pageMap);		
		
		List result = lookupservice.lookUpView(filterInfo);
		if(result.isEmpty()) {
			return "common/error/lookup";
		}
		
		model.addAttribute("result", result);
		return "etc/lookup";

	}
}
