package com.hicamper.test.etc.search.filter;

import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
@Repository
public class Criteria {
	
	public static Map cri(Map filterInfo) {
		int currentPage = Integer.parseInt(filterInfo.get("currentPage").toString());
		if(currentPage <= 0) {
			filterInfo.put("currentPage", 1);
		}

		int perPageNum = Integer.parseInt(filterInfo.get("perPageNum").toString());
		if(perPageNum <= 0 || perPageNum >100) {
			filterInfo.put("perPageNum", 5);
		}
		
		int pageStart = (currentPage - 1) * perPageNum;
		filterInfo.put("pageStart", pageStart);
		
		return filterInfo;
	}
	

}
