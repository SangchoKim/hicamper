package com.hicamper.test.web.members.common.board;

import java.sql.Timestamp;

public class WriteInfo {

	private long idx;
	private String title;
	private String content;
	private Timestamp date;
	private int hit;
	private int board_group;
	
	public int getBoard_group() {
		return board_group;
	}
	
	public void setBoard_group(int board_group) {
		this.board_group = board_group;
	}
	
	public long getIdx() {
		return idx;
	}
	
	public void setIdx(long idx) {
		this.idx = idx;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;	
	}
	
	public Timestamp getDate() {
		return date;
	}
	
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	public int getHit() {
		return hit;
	}
	
	public void setHit(int hit) {
		this.hit = hit;
	}

}
