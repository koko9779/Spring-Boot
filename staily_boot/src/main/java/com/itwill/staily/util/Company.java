package com.itwill.staily.util;

public class Company {
	/*
	 이름       널?       유형      
	-------- -------- ------- 
	M_NO     NOT NULL NUMBER  
	CO_NO    NOT NULL NUMBER  
	CO_CHECK          CHAR(1)  
	 */
	
	private int mNo; //회원번호
	private int coNo; //사업자등록번호
	private String coCheck; //결제여부
	
	public Company() {
		// TODO Auto-generated constructor stub
	}
	
	public Company(int mNo, int coNo, String coCheck) {
		this.mNo = mNo;
		this.coNo = coNo;
		this.coCheck = coCheck;
	}

	@Override
	public String toString() {
		return "Company [mNo=" + mNo + ", coNo=" + coNo + ", coCheck=" + coCheck + "]";
	}
	
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public int getCoNo() {
		return coNo;
	}
	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}
	public String getCoCheck() {
		return coCheck;
	}
	public void setCoCheck(String coCheck) {
		this.coCheck = coCheck;
	}
	
}
