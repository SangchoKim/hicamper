package com.hicamper.test.web.members.common.service;

import javax.servlet.http.HttpServletResponse;

public interface HFindIDService {

	public String hostfind_id(HttpServletResponse resp, String email) throws Exception;

}
