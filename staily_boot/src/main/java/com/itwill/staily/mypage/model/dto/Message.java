package com.itwill.staily.mypage.model.dto;

import com.itwill.staily.util.Member;

public class Message {
	private int msNo;			//메시지번호
	private int mNo;			//멤버번호
	private String msTitle;	//메시지타이틀
	private String msContent;	//메시지내용
	private String msDate;		//메시지일시
	private String mId;			//회원아이디
	private int rNo;			//받는사람번호
	
	private Member member;
	
	public Message() {
		
	}
	
	public Message(int mNo, String msTitle, String msContent, String msDate, int rNo) {
		super();
		this.mNo = mNo;
		this.msTitle = msTitle;
		this.msContent = msContent;
		this.msDate = msDate;
		this.rNo = rNo;
	}

	public Message(int msNo, int mNo, String msTitle, String msContent, String msDate, int rNo) {
		super();
		this.msNo = msNo;
		this.mNo = mNo;
		this.msTitle = msTitle;
		this.msContent = msContent;
		this.msDate = msDate;
		this.rNo = rNo;
	}
	
	public Message(int mNo, String msTitle, String msContent, int rNo) {
		super();
		this.mNo = mNo;
		this.msTitle = msTitle;
		this.msContent = msContent;
		this.rNo = rNo;
	}

	public int getMsNo() {
		return msNo;
	}

	public void setMsNo(int msNo) {
		this.msNo = msNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getMsTitle() {
		return msTitle;
	}

	public void setMsTitle(String msTitle) {
		this.msTitle = msTitle;
	}

	public String getMsContent() {
		return msContent;
	}

	public void setMsContent(String msContent) {
		this.msContent = msContent;
	}

	public String getMsDate() {
		return msDate;
	}

	public void setMsDate(String msDate) {
		this.msDate = msDate;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	
	
	 
	
}