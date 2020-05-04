package com.itwill.staily.stylecoodination.service;

import java.util.List;

import com.itwill.staily.util.Board;

public interface StyleCoodinationService {

	public int modifyBoardAndReply(Board updateBoard) throws Exception;

	public int writeBoard(Board board) throws Exception;
	
	public Board selectUpdateBoard(int bNo);

	public int removeBoard(int bNo) throws Exception;

	public Board writeReply(Board replyBoard, String mId) throws Exception;

	public int removeReply(int bNo) throws Exception;

	public int checkChoice(int bNo) throws Exception;

	public int checkRecommend(int bNo) throws Exception;

	public List<Board> findBoardTop10();

	public List<Board> findBoardAll(String bType);
	
	public List<Board> findBoardOne(int bNo, int userNo);
	
	public Board findUpdateBoard(int bNo);

	public int findBoardCount();

	public int findBoardReplyCount(String bType);

	public int updateViewCount(int bNo) throws Exception;
	
	public int selectBoardTop10ReplyCount();

	public List<Board> findBoardCategory(Board b);

	public int findBoardCategoryCount(Board b);

	public int findBoardReplyCategoryCount(Board b);

	public int isRecommendCheck(Board b);

	public void deleteRec(Board updateBoard);

	public void insertRec(Board updateBoard);

	public int totRec(Board updateBoard);

}