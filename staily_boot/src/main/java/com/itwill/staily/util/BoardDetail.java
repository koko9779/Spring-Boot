package com.itwill.staily.util;

public class BoardDetail {
	/*
	 이름       널?       유형            
	-------- -------- ------------- 
	B_NO     NOT NULL NUMBER        
	BD_IMAGE NOT NULL VARCHAR2(200) 
	 */
	private int bdNo; //게시물상세번호
	private int bNo; //게시물번호
	private String bdImage; //이미지
	
	public int getBdNo() {
		return bdNo;
	}

	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}

	public BoardDetail(int bdNo, int bNo, String bdImage) {
		this.bdNo = bdNo;
		this.bNo = bNo;
		this.bdImage = bdImage;
	}

	public BoardDetail() {
		// TODO Auto-generated constructor stub
	}
	
	public BoardDetail(int bNo, String bdImage) {
		super();
		this.bNo = bNo;
		this.bdImage = bdImage;
	}

	@Override
	public String toString() {
		return "BoardDetail [bNo=" + bNo + ", bdImage=" + bdImage + "]";
	}
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getBdImage() {
		return bdImage;
	}
	public void setBdImage(String bdImage) {
		this.bdImage = bdImage;
	}
	
}
