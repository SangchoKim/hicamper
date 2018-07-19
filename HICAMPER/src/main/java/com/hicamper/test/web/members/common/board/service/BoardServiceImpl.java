package com.hicamper.test.web.members.common.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.web.members.common.board.Overlapping_Board;
import com.hicamper.test.web.members.common.board.WriteInfo;
import com.hicamper.test.web.members.common.board.dao.BoardDao;

@Service("boardService")
@Transactional(readOnly = true)
public class BoardServiceImpl implements BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	Overlapping_Board overlapping;
	
	@Autowired
	private BoardDao dao;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int BinsertPost(Map map) {
		return overlapping.overlap_2(dao.BinsertPost(map));
	}

	@Override
	public List<WriteInfo> BpostList(Map map) throws Exception {
		return dao.BpostList(map);
	}

	@Override
	public List<WriteInfo> BpageList(int offset, int noOfRecords) throws Exception {
		return dao.BpageList(offset, noOfRecords);
	}

	@Override
	public int BgetCount() throws Exception {
		return dao.BgetCount();
	}

	@Override
	public int getCount(int board_group) throws Exception {
		return dao.getCount(board_group);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public Map<String, Object> BdetailPost(int board_group, long idx) throws Exception {
		dao.BhitPost(idx);
		return dao.BdetailPost(board_group,idx);
	}

	@Override
	public List<WriteInfo> BPNPostList(long idx) throws Exception {
		return dao.BPNPostList(idx);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void BupdatePost(Map<String, String> info) throws Exception {
		 dao.BupdatePost(info);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void BdeletePost(Map<String, String> info) throws Exception {
		 dao.BdeletePost(info);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int increaseHit(Map map) {
		return dao.increaseHit(map);
	}
	
	@Override
	public Map getPost(Map map) {
		return dao.getPost(map);
	}
}
