package com.itwill.staily.mypage.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.staily.mypage.model.dto.Friend;
import com.itwill.staily.util.Member;

public interface FriendService {
	//친구 1명 출력(Pk로)
	//회원의 친구 리스트 출력(m_no로)
	//친구 추가
	//친구 삭제(Pk로)
	
	public List<Friend> selectList(int mNo) throws Exception;
	
	public Friend selectFriendPk(@Param("mNo") int mNo, @Param("fNo") int fNo) throws Exception;
	
	public boolean createFriend(@Param("mNo") int mNo, @Param("fNo") int fNo) throws Exception;
	
	public boolean deleteFriend(int fPk) throws Exception;
	
	public String findFriend(String mId) throws Exception;
	
	public int findFriendNo(String mId) throws Exception;
	
	public int duplicateFriend(String mId) throws Exception;
	
	public int duplicateFriendNo(@Param("mNo") int mNo, @Param("fNo") int fNo) throws Exception;
}
