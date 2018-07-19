package com.hicamper.test.web.members.common.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicamper.test.etc.search.filter.sql.filterMapper;
import com.hicamper.test.web.members.common.board.WriteInfo;
import com.hicamper.test.web.members.common.board.sql.BoardMapper;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlsession;
	
	int noOfRecords;
	
	@Override
	public int BinsertPost(Map map) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.BinsertPost(map);
	}

	@Override
	public List<WriteInfo> BpostList(Map map) throws Exception {
		BoardMapper Boardmapper = sqlsession.getMapper(BoardMapper.class);
		return Boardmapper.BpostList(map);
	}

	@Override
	public List<WriteInfo> BpageList(int offset, int noOfRecords) throws Exception {
		List<WriteInfo> pageList = new ArrayList<WriteInfo>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		pageList = sqlsession.selectList("BpageList", params);
		this.noOfRecords = sqlsession.selectOne("BgetCount");
		
		return pageList;
	}

	@Override
	public int BgetCount() throws Exception {
		return sqlsession.selectOne("BgetCount");
	}

	@Override
	public int getCount(int board_group) throws Exception {
		BoardMapper Boardmapper = sqlsession.getMapper(BoardMapper.class);
		return Boardmapper.getCount(board_group);
	}



	@Override
	public long BhitPost(long idx) throws Exception {
		return sqlsession.update("BhitPost", idx);

	}

	@Override
	public List<WriteInfo> BPNPostList(long idx) throws Exception {
		return sqlsession.selectList("BPNPostList", idx);
		
	}

	@Override
	public void BupdatePost(Map<String, String> info) throws Exception {	
		 sqlsession.update("BupdatePost", info);
	}

	@Override
	public void BdeletePost(Map<String, String> info) throws Exception {
		 sqlsession.delete("BdeletePost", info);

	}

	@Override
	public Map<String,Object> BdetailPost(int board_group, long idx) {
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("board_group", board_group);
		params.put("idx", idx);
		
		return sqlsession.selectOne("BdetailPost", params);
	}
	
	@Override
	public int increaseHit(Map map) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.increaseHit(map);
	}
	
	@Override
	public Map getPost(Map map) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.getPost(map);
	}
}
