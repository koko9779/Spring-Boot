package com.example.demo.mgr;

import java.util.List;

import com.example.demo.dto.Board;
import com.example.demo.dto.Pagination;

public interface BoardService {
	
	public List<Board> getBoardList(Pagination pagination) throws Exception;
	
	int getBoardListCnt() throws Exception;
	
	void insertBoard(Board board) throws Exception;
	
	Board getBoardDetail(int boardnum) throws Exception;
	
	void updateBoard(Board board) throws Exception;
	
	void deleteBoard(int boardnum) throws Exception;
	
	void updateBoardReadcount(int boardnum) throws Exception;
}
