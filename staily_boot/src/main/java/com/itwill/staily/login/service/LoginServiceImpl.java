package com.itwill.staily.login.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.staily.login.exception.FailCreateException;
import com.itwill.staily.login.exception.NoExistedIdException;
import com.itwill.staily.login.exception.NoSearchMemberException;
import com.itwill.staily.login.exception.PasswordMissmatchException;
import com.itwill.staily.login.mapper.LoginCommonMapper;
import com.itwill.staily.login.mapper.LoginMapper;
import com.itwill.staily.login.mapper.SignUpMapper;
import com.itwill.staily.util.Member;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private SignUpMapper signMapper;	
	@Autowired
	private LoginCommonMapper loginCommonMapper;
	
	public LoginServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public Member login(Member member) throws Exception { 
		String pw;
		int isExisted = 0;
		Member MnoMtype = null;
		
		isExisted = loginCommonMapper.isExistedId(member.getmId());
		if(isExisted == 1) {
			pw = loginMapper.selectMemberPw(member.getmId());
			if(pw.equals(member.getmPw())) {
				//기업회원인지 검사하는 메소드, 기업회원이면 상수오빠 메소드 실행하고 memberDTO 리턴, 아니면 바로 memberDTO 리턴
				MnoMtype = loginCommonMapper.selectMNoMType(member.getmId());
				member.setmNo(MnoMtype.getmNo());
				member.setmType(MnoMtype.getmType());
				return member;
			}else {
				throw new PasswordMissmatchException("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			}
 		}else {
			throw new NoExistedIdException("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		}
	}
	
	@Override
	public String findId(String mPhone, String mName) throws Exception{
		String id;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mPhone", mPhone);
		map.put("mName", mName);
		
		id = loginMapper.selectIdOne(map);
		if(id == null) {
			throw new NoSearchMemberException("일치하는 계정이 없습니다");
		}
		return id;
	}
	
	public int isExistedId(String mId) throws Exception {
		return loginCommonMapper.isExistedId(mId);
	}
	
	/************************** 비밀번호 찾기 **************************/
	@Override
	public int isIdExistForPw(String mId, String mPhone) throws Exception{
		int count = 0;
		int existCount = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mId", mId);
		map.put("mPhone", mPhone);
		
		existCount = loginMapper.isExistedIdForPw(map);
		if(existCount != 1) {
			throw new NoSearchMemberException("일치하는 계정이 없습니다");
		}else {
			count = 1;
		}
		return count; 
	}
	//맞으면 새비밀번호 입력창으로 이동 
	
	//새 비밀번호 입력창에서 입력된 비밀번호로 업데이트
	@Override
	public int updatePw(Member updatePwMember) {
		return loginMapper.updatePwOne(updatePwMember);
	}
	/******************************************************************/
	@Override
	public int isEmailExist(String mEmail) {
		return loginCommonMapper.isExistedEmail(mEmail);
	}
	
	@Override
	public int signUpMember(Member member) throws Exception {
		int successCount = 0;
		
		successCount = signMapper.createMember(member);
		if(successCount != 1) {
			throw new FailCreateException("회원가입에 실패하였습니다");
		}
 		return successCount;
	}
	
	@Override
	public int signUpCompany(Member member) throws Exception {
		int signUpCountM = 0;
		int signUpCountC = 0;
		
		// coNo를 입력하지 않으면 들어올 수 없도록 유효성체크 필수!!
		signUpCountM = signMapper.createMember(member);
		if(signUpCountM == 1) {
			signUpCountC = signMapper.createCompany(member.getmCompany().getCoNo());
			if(signUpCountC != 1) {
				throw new FailCreateException("회원가입에 실패하였습니다");
			}
		}else {
			throw new FailCreateException("회원가입에 실패하였습니다");
		}
		return signUpCountC;
	}

	@Override
	public int naverIdCounter(String string) {
		
		return 0;
	}
	
	
	
	
	
	
	
	
	
}
