package com.itwill.staily.mypage.model.dto;

import com.itwill.staily.util.Member;

public class Friend {
	private int fPk;	//친구pk
	private int fNo;	//친구번호
	private Integer mNo;	//회원번호
	private String mId; //회원아이디
		
	private Member member;
	
	public Friend() {
		
	}
	
	public Friend(int fNo, int mNo) {
		super();
		this.fNo = fNo;
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmName(String mId) {
		this.mId = mId;
	}



	public Friend(int fPk, int fNo, int mNo) {
		super();
		this.fPk = fPk;
		this.fNo = fNo;
		this.mNo = mNo;
	}
	
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public int getfPk() {
		return fPk;
	}

	public void setfPk(int fPk) {
		this.fPk = fPk;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "Friend [fPk=" + fPk + ", fNo=" + fNo + ", mNo=" + mNo + "]";
	}

	
	
}
