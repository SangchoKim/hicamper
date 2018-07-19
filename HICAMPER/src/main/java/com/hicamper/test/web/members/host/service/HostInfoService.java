package com.hicamper.test.web.members.host.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface HostInfoService {

	public List showInfo(Map map);
	@Transactional
	public int subtractPoint(Map map) throws Exception;
	public int addPoint(Map map) throws Exception;
	public int updateInfo(Map map);
	public int deleteInfo(Map map);
}
