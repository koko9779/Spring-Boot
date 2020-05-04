package com.itwill.staily.login.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.util.Member;
@Mapper
public interface LoginCommonMapper {
	
	public int isExistedId(String mId);
	
	public int isExistedEmail(String mEmail);
	
	public Member selectMNoMType(String mId);
}
