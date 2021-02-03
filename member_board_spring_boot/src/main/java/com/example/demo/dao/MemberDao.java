package com.example.demo.dao;

import java.util.List;

import com.example.demo.dto.Member;

public interface MemberDao {

	List<Member> getMemberList();

	Member getMember(String id);
	
	void insertMember(Member member);
	
	int getMemberCount(String id);
	
	Member loginCheck(String id, String password);
}
