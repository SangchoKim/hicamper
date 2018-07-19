package com.hicamper.test.etc.search.filter;

import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
@Repository
public class PageMaker {
	
	public static Map calcData(Map filterInfo) {
		int totalCount = Integer.parseInt(filterInfo.get("totalCount").toString());
		int currentPage = Integer.parseInt(filterInfo.get("currentPage").toString());
		int perPageNum = Integer.parseInt(filterInfo.get("perPageNum").toString());
		int displayPageNum = 5;
		int prevPage = currentPage - 1;
		int nextPage = currentPage + 1;
		
		int endPage = (int) (Math.ceil(currentPage/(double) displayPageNum)*displayPageNum);
		int startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount/ (double)perPageNum));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		boolean prev = startPage == 1 ? false : true;
		boolean next = endPage * perPageNum >= totalCount ? false : true;
		
		filterInfo.put("endPage", endPage);
		filterInfo.put("startPage", startPage);
		filterInfo.put("tempEndPage", tempEndPage);
		filterInfo.put("prev", prev);
		filterInfo.put("prevPage", prevPage);
		filterInfo.put("next", next);
		filterInfo.put("nextPage", nextPage);
		
		return filterInfo;
	}

}
