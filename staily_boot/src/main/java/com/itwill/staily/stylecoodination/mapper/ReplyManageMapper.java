package com.itwill.staily.stylecoodination.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.util.Board;
@Mapper
public interface ReplyManageMapper {
	/******************* 답글쓰기 작업 *****************/
	//기존의 답글 step 하나씩 미루기
	public int updateStep(int bGroupNo) throws Exception;
	
	//CommonMapper에서 selectMNo 이용(m_no)
	
	//답글 쓰기
	public int createReply(Board board);
	/**************************************************/ 
	//답글 수정은 CommonMapper에 있음

	//답글 삭제
	public int deleteReply(int bNo) throws Exception;
	
	//답글채택
	public int updateChoice(int bNo) throws Exception;
	
	//추천수 올리기
	public int updateRecommend(int bNo) throws Exception;

	
	public int totalRec(int bNo);

	public int isRecommmendCheck(Board b);

	public void deleteRec(Board updateBoard);

	public void insertRec(Board updateBoard);

	public int selectTotRec(Board updateBoard);
		
}
