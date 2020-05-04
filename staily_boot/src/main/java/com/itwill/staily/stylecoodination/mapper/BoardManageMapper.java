package com.itwill.staily.stylecoodination.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.util.Board;
@Mapper
public interface BoardManageMapper {
	public int createBoard(Board b);

	//원글 수정은 CommonMapper에 있음
	
	public int deleteBoard(int bNo) throws Exception;
	
	//수정 폼에서 데이터를 가져오기 위한 sql
	public Board selectUpdateBoard(int bNo);
}
