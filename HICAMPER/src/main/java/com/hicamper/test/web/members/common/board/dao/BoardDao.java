package com.hicamper.test.web.members.common.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hicamper.test.web.members.common.board.WriteInfo;

public interface BoardDao {
	
	public int BinsertPost(Map map);
	public List<WriteInfo> BpostList(Map map) throws Exception;
	public List<WriteInfo> BpageList(int offset, int noOfRecords) throws Exception; 
	public int BgetCount() throws Exception; 
	public int getCount(int board_group) throws Exception; 
	public long BhitPost(long idx) throws Exception;
	public List<WriteInfo> BPNPostList(long idx) throws Exception;
	public void BupdatePost(Map<String, String> info) throws Exception;
	public void BdeletePost(Map<String, String> info) throws Exception;
	public Map<String, Object> BdetailPost(int board_group, long idx);
	public int increaseHit(Map map);
	public Map getPost(Map map);
}

