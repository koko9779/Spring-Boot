package com.itwill.staily.stylecoodination.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.staily.stylecoodination.mapper.BoardCommonMapper;
import com.itwill.staily.stylecoodination.mapper.BoardManageMapper;
import com.itwill.staily.stylecoodination.mapper.ReplyManageMapper;
import com.itwill.staily.stylecoodination.mapper.ViewMapper;
import com.itwill.staily.util.Board;

@Service
public class StyleCoodinationServiceImpl implements StyleCoodinationService {
	@Autowired
	private BoardManageMapper boardManageMapper;
	@Autowired
	private BoardCommonMapper boardCommonMapper;
	@Autowired
	private ReplyManageMapper replyManageMapper;
	@Autowired
	private ViewMapper viewMapper;
	
	@Override
	public int modifyBoardAndReply(Board updateBoard) throws Exception{
		if(updateBoard.getbCategory() == null) {
			updateBoard.setbCategory("");
		}
		return boardCommonMapper.updateBoardAndReply(updateBoard);
	}
	
	@Override
	public int writeBoard(Board board) throws Exception{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String bDate = df.format(new Date());
		board.setbDate(bDate);
		return boardManageMapper.createBoard(board);
	}
	
	@Override
	public int removeBoard(int bNo) throws Exception{
		return boardManageMapper.deleteBoard(bNo);
	}
	
	@Override
	public Board selectUpdateBoard(int bNo) {
		return boardManageMapper.selectUpdateBoard(bNo); 
	}
	
	@Override
	public Board writeReply(Board replyBoard, String mId) throws Exception{
		int mNo = 0;
		int createCount;
		Board writeReplyB = new Board();
		SimpleDateFormat df;
		String bDate = "";
		
		// 1. 기존 댓글들의 step 1씩 증가
		replyManageMapper.updateStep(replyBoard.getbGroupNo());
		// 2. mNo를 구하기 위한 작업
		mNo = boardCommonMapper.selectMNo(mId);
		replyBoard.setmNo(mNo);
		
		// 3. 날짜를 String으로 가공하기
		df = new SimpleDateFormat("yyyy-MM-dd");
		bDate = df.format(new Date());
		replyBoard.setbDate(bDate);
		// 4. 댓글 작성
		createCount = replyManageMapper.createReply(replyBoard);
		// 5. 작성이 잘 되었으면 board 반환
		if(createCount == 1) {
			writeReplyB = boardCommonMapper.selectBoardOrReply(replyBoard.getbGroupNo());
		}
		return writeReplyB;
	}
	
	@Override
	public int removeReply(int bNo) throws Exception{
		return replyManageMapper.deleteReply(bNo);
	}
	
	@Override
	public int checkChoice(int bNo) throws Exception{
		return replyManageMapper.updateChoice(bNo);
	}
	
	@Override
	public int checkRecommend(int bNo) throws Exception{
		return replyManageMapper.updateRecommend(bNo);
	}

	@Override
	public List<Board> findBoardTop10() {
		return viewMapper.selectBoardTop10();
	}
	
	@Override
	public List<Board> findBoardAll(String bType) {
		return viewMapper.selectBoardAll(bType);
	}
	
	@Override
	public List<Board> findBoardOne(int bNo, int userNo) {
		Board b = new Board();
		b.setbNo(bNo);
		b.setmNo(userNo);
		System.out.println(userNo);
		
		return viewMapper.selectBoardOne(b);
	}

	
	@Override
	public int findBoardCount() {
		return viewMapper.selectBoardCount();
	}
	
	@Override
	public int findBoardReplyCount(String bType) {
		return viewMapper.selectBoardReplyCount(bType);
	}
	
	@Override
	public int updateViewCount(int bNo) throws Exception{
		return viewMapper.updateView(bNo);
	}

	@Override
	public Board findUpdateBoard(int bNo) {
		return viewMapper.selectUpdateBoard(bNo);
	}

	@Override
	public int selectBoardTop10ReplyCount() {
		return viewMapper.selectBoardTop10ReplyCount();
	}

	@Override
	public List<Board> findBoardCategory(Board b) {
		
		return viewMapper.findBoardCategory(b);
	}

	@Override
	public int findBoardCategoryCount(Board b) {
		return viewMapper.selectBoardCategoryCount(b);
	}

	@Override
	public int findBoardReplyCategoryCount(Board b) {
		return viewMapper.selectBoardReplyCategoryCount(b);
	}

	@Override
	public int isRecommendCheck(Board b) {
		return replyManageMapper.isRecommmendCheck(b);
	}

	@Override
	public void deleteRec(Board updateBoard) {
		 replyManageMapper.deleteRec(updateBoard);
	}

	@Override
	public void insertRec(Board updateBoard) {
		replyManageMapper.insertRec(updateBoard);
	}

	@Override
	public int totRec(Board updateBoard) {
		return replyManageMapper.selectTotRec(updateBoard);
	}


}
