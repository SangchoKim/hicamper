package com.hicamper.test.web.members.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.user.dao.UserDAO;

@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDAO userDAO;
	
	public List getAllUser(Map map) {
		return userDAO.getAllUser(map);
	}
}
