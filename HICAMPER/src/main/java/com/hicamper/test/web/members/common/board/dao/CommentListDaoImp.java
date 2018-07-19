package com.hicamper.test.web.members.common.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.web.members.common.board.sql.CommentListMapper;

@Repository
public class CommentListDaoImp implements CommentListDao {
	
	private static final Logger logger = LoggerFactory.getLogger(CommentListDaoImp.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List showComment(Map map) {
		CommentListMapper mapper = sqlsession.getMapper(CommentListMapper.class);
		return mapper.showComment(map);
	}

	@Override
	public int writeComment(Map map) {
		CommentListMapper mapper = sqlsession.getMapper(CommentListMapper.class);
		return mapper.writeComment(map);
	}
	
	@Override
	public List showUpdate_form(Map map) {
		CommentListMapper mapper = sqlsession.getMapper(CommentListMapper.class);
		return mapper.showUpdate_form(map);
	}

	@Override
	public int updateComment(Map map) {
		CommentListMapper mapper = sqlsession.getMapper(CommentListMapper.class);
		return mapper.updateComment(map);
	}

	@Override
	public int deleteComment(Map map) {
		CommentListMapper mapper = sqlsession.getMapper(CommentListMapper.class);
		return mapper.deleteComment(map);
	}

}
