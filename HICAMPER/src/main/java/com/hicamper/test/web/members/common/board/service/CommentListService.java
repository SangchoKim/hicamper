package com.hicamper.test.web.members.common.board.service;

import java.util.List;
import java.util.Map;

public interface CommentListService {
	
	public List showComment(Map map);
	
	public int writeComment(Map map);
	
	public List showUpdate_form(Map map);
	
	public int updateComment(Map map);
	
	public int deleteComment(Map map);
	
}
