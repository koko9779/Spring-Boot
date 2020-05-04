package com.itwill.staily.stylecoodination.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.util.Board;
@Mapper
public interface ViewMapper {
	
	public List<Board> selectBoardTop10();
	
	public List<Board> selectBoardAll(String bType);
	
	public List<Board> selectBoardOne(Board b);
	
	//수정 시에 사용할 select문
	public Board selectUpdateBoard(int bNo);
	
	//누적 질문 수
	public int selectBoardCount();
	
	//누적 답변 수 
	public int selectBoardReplyCount(String bType);
	
	//조회수 올리기
	public int updateView(int bNo) throws Exception;
	
	public int selectBoardTop10ReplyCount();

	public List<Board> findBoardCategory(Board b);

	public int selectBoardCategoryCount(Board b);

	public int selectBoardReplyCategoryCount(Board b);
	
}
