package com.itwill.staily.mypage.model.dto;

public class Payment {
	private int pyNo;			//결제번호
	private int mNo;			//회원번호
	private int pyPrice;		//결제가격
	private String pyDate;		//결제일시
	private String pyName;		//결제상품이름
	private int pyPeriod;		//결제기간
	private String pyType;		//결제타입
	private String endDate; 	//결제종료일
	
	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public Payment() {
		
	}
	

	public Payment(int pyNo, int mNo, int pyPrice, String pyDate, String pyName, int pyPeriod, String pyType) {
		super();
		this.pyNo = pyNo;
		this.mNo = mNo;
		this.pyPrice = pyPrice;
		this.pyDate = pyDate;
		this.pyName = pyName;
		this.pyPeriod = pyPeriod;
		this.pyType = pyType;
	}
	
	public Payment(int mNo, int pyPrice, String pyName, int pyPeriod,String pyType) {
		this.mNo = mNo;
		this.pyPrice = pyPrice;
		this.pyName = pyName;
		this.pyPeriod = pyPeriod;
		this.pyType = pyType;
	}
	

	@Override
	public String toString() {
		return "Payment [pyNo=" + pyNo + ", mNo=" + mNo + ", pyPrice=" + pyPrice + ", pyDate=" + pyDate + ", pyName="
				+ pyName + ", pyPeriod=" + pyPeriod + ", pyType=" + pyType + "]";
	}


	public int getPyNo() {
		return pyNo;
	}

	public void setPyNo(int pyNo) {
		this.pyNo = pyNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getPyPrice() {
		return pyPrice;
	}

	public void setPyPrice(int pyPrice) {
		this.pyPrice = pyPrice;
	}

	public String getPyDate() {
		return pyDate;
	}

	public void setPyDate(String pyDate) {
		this.pyDate = pyDate;
	}

	public String getPyName() {
		return pyName;
	}

	public void setPyName(String pyName) {
		this.pyName = pyName;
	}

	public int getPyPeriod() {
		return pyPeriod;
	}

	public void setPyPeriod(int pyPeriod) {
		this.pyPeriod = pyPeriod;
	}

	public String getPyType() {
		return pyType;
	}

	public void setPyType(String pyType) {
		this.pyType = pyType;
	}
	
}	