package com.hicamper.test.web.members.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserInfoService {
	
	public List showInfo(Map map);
	@Transactional
	public int updateInfo(Map map);
	public int deleteInfo(Map map);

}
