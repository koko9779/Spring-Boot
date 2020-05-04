package com.itwill.staily.stylecoodination.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.util.Board;
import com.itwill.staily.util.BoardDetail;
@Mapper
public interface BoardCommonMapper {
	//id를 토대로 m_no 가져오기
	public int selectMNo(String mId);
	
	//m_no를 토대로 id 가져오기
	public String selectId(int mNo);
	
	//원글과 답글 수정
	public int updateBoardAndReply(Board board) throws Exception;

	public Board selectBoardOrReply(int mNo);
	
}
