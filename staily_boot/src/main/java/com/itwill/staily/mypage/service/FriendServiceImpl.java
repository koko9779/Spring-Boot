package com.itwill.staily.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.staily.mypage.mapper.FriendMapper;
import com.itwill.staily.mypage.model.dto.Friend;
import com.itwill.staily.util.Member;

@Service
public class FriendServiceImpl implements FriendService {
	@Autowired
	private FriendMapper friendMapper;
	
	@Override
	public List<Friend> selectList(int mNo) throws Exception {
		return friendMapper.selectList(mNo);
	}

	@Override
	public boolean createFriend(int fNo, int mNo) throws Exception {
		return friendMapper.createFriend(fNo,mNo);
	}

	@Override
	public boolean deleteFriend(int fPk) throws Exception {
		return friendMapper.deleteFriend(fPk);
	}

	@Override
	public String findFriend(String mId) throws Exception {
		return friendMapper.findFriend(mId);
	}

	@Override
	public int duplicateFriend(String mId) throws Exception {
		return friendMapper.duplicateFriend(mId);
	}

	@Override
	public int findFriendNo(String mId) throws Exception {
		return friendMapper.findFriendNo(mId);
	}

	@Override
	public int duplicateFriendNo(int mNo, int fNo) throws Exception {
		return friendMapper.duplicateFriendNo(mNo,fNo);
	}

	@Override
	public Friend selectFriendPk(int mNo, int fNo) throws Exception {
		return friendMapper.selectFriendPk(mNo, fNo);
	}

}
