package com.itwill.staily.login.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.util.Member;
@Mapper
public interface LoginMapper {

	public String selectMemberPw(String mId);

	public String selectIdOne(HashMap<String, Object> map);
	/************ 비밀번호 찾기 ****************/
	public int isExistedIdForPw(HashMap<String, Object> map);
	
	public int updatePwOne(Member updatePwMember);
}
