package com.itwill.staily.login.service;

import com.itwill.staily.util.Member;

public interface LoginService {

	public Member login(Member member) throws Exception;

	public String findId(String mPhone, String mName) throws Exception;

	public int isExistedId(String mId) throws Exception;
	
	/************************** 비밀번호 찾기 **************************/
	public int isIdExistForPw(String mId, String mPhone) throws Exception;
	//맞으면 새비밀번호 입력창으로 이동 

	//새 비밀번호 입력창에서 입력된 비밀번호로 업데이트  
	public int updatePw(Member updatePwMember);

	/******************************************************************/
	public int isEmailExist(String mEmail);
	     
	public int signUpMember(Member member) throws Exception;

	public int signUpCompany(Member member) throws Exception;

	public int naverIdCounter(String string);

}