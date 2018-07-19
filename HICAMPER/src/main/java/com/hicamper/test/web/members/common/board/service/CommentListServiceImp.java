package com.hicamper.test.web.members.common.board.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.common.board.dao.CommentListDao;

@Service
@Transactional(readOnly = true)
public class CommentListServiceImp implements CommentListService {
	
	private static final Logger logger = LoggerFactory.getLogger(CommentListServiceImp.class);
	
	@Autowired
	private CommentListDao commentdao;
	
	@Override
	public List showComment(Map map) {
		return commentdao.showComment(map);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int writeComment(Map map) {
		return commentdao.writeComment(map);
	}
	
	@Override
	public List showUpdate_form(Map map) {
		return commentdao.showUpdate_form(map);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int updateComment(Map map) {
		return commentdao.updateComment(map);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int deleteComment(Map map) {
		return commentdao.deleteComment(map);
	}

}
