package com.hicamper.test.etc.search.lookup.service;

import java.util.List;
import java.util.Map;

public interface lookUpService {

	public List lookUpView(Map filterInfo);
	public int countList(Map filterInfo);
}
