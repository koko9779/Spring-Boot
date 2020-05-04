package com.itwill.staily.util;

public class Member {
	/*
	 이름         널?       유형            
	---------- -------- ------------- 
	M_NO       NOT NULL NUMBER        
	M_ID       NOT NULL VARCHAR2(50)  
	M_PW                VARCHAR2(50)  
	M_NAME              VARCHAR2(50)  
	M_ADDRESS           VARCHAR2(100) 
	M_DADDRESS          VARCHAR2(50)  
	M_EMAIL    NOT NULL VARCHAR2(50)  
	M_TYPE     NOT NULL CHAR(1)       
	M_PHONE             VARCHAR2(18)  
	 */
	
	private Integer mNo; // 회원번호
	private String mId; //아이디
	private String mPw; //비밀번호
	private String mName; //이름
	private String mAddress; //주소
	private String mDaddress; //상세주소
	private String mEmail; //이메일
	private String mType; //회원구분 (일반:M, 기업:C)
	private String mPhone; // 전화번호
	private Company mCompany; // 기업회원의 기업정보
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(int mNo, String mId, String mPw, String mName, String mAddress, String mDaddress, String mEmail,
			String mType, String mPhone, Company mCompany) {
		this.mNo = mNo;
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mAddress = mAddress;
		this.mDaddress = mDaddress;
		this.mEmail = mEmail;
		this.mType = mType;
		this.mPhone = mPhone;
		this.mCompany = mCompany;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mAddress=" + mAddress
				+ ", mDaddress=" + mDaddress + ", mEmail=" + mEmail + ", mType=" + mType + ", mPhone=" + mPhone
				+ ", mCompany=" + mCompany + "]";
	}
	
	public Member(int mNo, String mId, String mPw, String mName, String mAddress, String mDaddress, String mEmail,
			String mType, String mPhone) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mAddress = mAddress;
		this.mDaddress = mDaddress;
		this.mEmail = mEmail;
		this.mType = mType;
		this.mPhone = mPhone;
	}

	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public String getmDaddress() {
		return mDaddress;
	}
	public void setmDaddress(String mDaddress) {
		this.mDaddress = mDaddress;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmType() {
		return mType;
	}
	public void setmType(String mType) {
		this.mType = mType;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public Company getmCompany() {
		return mCompany;
	}
	public void setmCompany(Company mCompany) {
		this.mCompany = mCompany;
	}
	
	
	
}
