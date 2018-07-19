package com.hicamper.test.web.members.host.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;

public interface Camp_productService {
	
	public List showCamp_product(Map map);
	@Transactional
	public int addCamp_product(Map map) throws Exception;
	public List room_auth(Map map) throws Exception;
	public Integer compare_pw(Map map) throws Exception;	
	public int updateCamp_product(Map map) throws Exception;
	public int updateCamp_productWithoutUpload(Map map) throws Exception;
	public int deleteCamp_product(Map map);
}
