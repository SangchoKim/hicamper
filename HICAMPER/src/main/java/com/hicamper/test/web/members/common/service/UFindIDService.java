package com.hicamper.test.web.members.common.service;

import javax.servlet.http.HttpServletResponse;

public interface UFindIDService {

	public String userfind_id(HttpServletResponse resp, String email) throws Exception;

}
