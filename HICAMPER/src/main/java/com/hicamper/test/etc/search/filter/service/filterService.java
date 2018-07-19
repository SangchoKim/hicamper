package com.hicamper.test.etc.search.filter.service;

import java.util.List;
import java.util.Map;

public interface filterService {
	
	public int countList(Map map);

	public List filterCheck(Map map);

	public List showList(Map map);

}
