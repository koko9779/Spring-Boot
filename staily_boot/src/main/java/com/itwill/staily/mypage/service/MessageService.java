package com.itwill.staily.mypage.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.staily.mypage.model.dto.Message;

public interface MessageService {
	// 메시지 하나 선택
	public Message selectOne(@Param("rNo")int rNo,@Param("msNo")int msNo) throws Exception;

	// 메시지 받은 리스트
	public List<Message> selectList(int rNo) throws Exception;

	// 메시지 추가
	public boolean createMessage(Message message) throws Exception;

	// 메시지 삭제
	public boolean deleteMessage(int msNo) throws Exception;

}
