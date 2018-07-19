package com.hicamper.test.web.members.common.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.hicamper.test.web.members.common.dao.HFindIDDao;

@Service
public class HFindIDServiceImpl implements HFindIDService {
	
	@Inject
	private HFindIDDao findid;

	@Override
	public String hostfind_id(HttpServletResponse resp, String email) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String id = findid.hostfind_id(email);
		
		if(id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	

}
