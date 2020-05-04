package com.itwill.staily.util;

import org.springframework.stereotype.Component;

/*
		이름          널?       유형            
	----------- -------- ------------- 
	P_NO        NOT NULL NUMBER        
	M_NO        NOT NULL NUMBER        
	W_NO        NOT NULL NUMBER        
	P_NAME               VARCHAR2(200) 
	P_PRICE              NUMBER        
	P_URL                VARCHAR2(200) 
	P_ADDRESS            VARCHAR2(100) 
	P_DADDRRESS          VARCHAR2(50)  
	P_CHECK              CHAR(1)       
	P_VIEW               NUMBER        
	P_DATE               VARCHAR2(12)  
	이름       널?       유형            
	-------- -------- -------------
	PD_NO    NOT NULL NUMBER 
	P_NO     NOT NULL NUMBER        
	PD_IMAGE          VARCHAR2(200) 
	PD_SCENE          VARCHAR2(200) 
 */
@Component("Product")
public class Product {
	private int pNo; //상품 번호
	private int mNo; //회원 번호
	private int wNo; //작품 번호
	private String pName; //상품 이름
	private int pPrice; //상품 가격
	private String pUrl; //상품 url
	private String pAddress; //상품 주소
	private String pDaddress; //상품 상세 주소
	private String pCheck; //상품 승인 여부
	private int pView; //상품 조회 수
	private String pDate; //상품등록일
	private String pScene; //상품 장면
	

	private int pdNo; //상품 상세 번호
	private String pdImage; //상품 이미지
	private String mId; //회원 아이디
	
	
	public Product(int pNo, int mNo, int wNo, String pName, int pPrice, String pUrl, String pAddress, String pDaddress,
			String pCheck, int pView, String pDate, String pScene) {
		super();
		this.pNo = pNo;
		this.mNo = mNo;
		this.wNo = wNo;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pUrl = pUrl;
		this.pAddress = pAddress;
		this.pDaddress = pDaddress;
		this.pCheck = pCheck;
		this.pView = pView;
		this.pDate = pDate;
		this.pScene = pScene;
	}
	public Product(int pNo, int mNo, int wNo, String pName, int pPrice, String pUrl, String pAddress, String pDaddress,
			String pCheck, int pView, String pDate, String pScene, int pdNo, String pdImage) {
		super();
		this.pNo = pNo;
		this.mNo = mNo;
		this.wNo = wNo;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pUrl = pUrl;
		this.pAddress = pAddress;
		this.pDaddress = pDaddress;
		this.pCheck = pCheck;
		this.pView = pView;
		this.pDate = pDate;
		this.pScene = pScene;
		this.pdNo = pdNo;
		this.pdImage = pdImage;
		this.mId = mId;
	}
	public Product() {
		
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public int getwNo() {
		return wNo;
	}
	public void setwNo(int wNo) {
		this.wNo = wNo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	public String getpAddress() {
		return pAddress;
	}
	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}
	public String getpDaddress() {
		return pDaddress;
	}
	public void setpDaddress(String pDaddress) {
		this.pDaddress = pDaddress;
	}
	public String getpCheck() {
		return pCheck;
	}
	public void setpCheck(String pCheck) {
		this.pCheck = pCheck;
	}
	public int getpView() {
		return pView;
	}
	public void setpView(int pView) {
		this.pView = pView;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getpScene() {
		return pScene;
	}
	public void setpScene(String pScene) {
		this.pScene = pScene;
	}
	public int getPdNo() {
		return pdNo;
	}
	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}
	public String getPdImage() {
		return pdImage;
	}
	public void setPdImage(String pdImage) {
		this.pdImage = pdImage;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", mNo=" + mNo + ", wNo=" + wNo + ", pName=" + pName + ", pPrice=" + pPrice
				+ ", pUrl=" + pUrl + ", pAddress=" + pAddress + ", pDaddress=" + pDaddress + ", pCheck=" + pCheck
				+ ", pView=" + pView + ", pDate=" + pDate + ", pScene=" + pScene + ", pdNo=" + pdNo + ", pdImage="
				+ pdImage + ", mId=" + mId + "]";
	}
	
	

	
	
}
