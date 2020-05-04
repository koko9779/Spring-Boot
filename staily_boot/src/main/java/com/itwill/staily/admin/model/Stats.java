
package com.itwill.staily.admin.model;

public class Stats {
	//통계번호
	private int stNo;
	private String stIp;
	private String stTime;
	private String stRefer;
	private String stAgent;
	private int cnt;
	
	private int nrNo;
	private int mNo;
	private String mId;
	private String nrContent;
	
	public int getNrNo() {
		return nrNo;
	}
	public void setNrNo(int nrNo) {
		this.nrNo = nrNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getNrContent() {
		return nrContent;
	}
	public void setNrContent(String nrContent) {
		this.nrContent = nrContent;
	}
	public Stats(int mNo, String nrContent) {
		super();
		this.mNo = mNo;
		this.nrContent = nrContent;
	}
	public Stats() {
		// TODO Auto-generated constructor stub
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Stats(int stNo, String stIp, String stTime, String stRefer, String stAgent) {
		super();
		this.stNo = stNo;
		this.stIp = stIp;
		this.stTime = stTime;
		this.stRefer = stRefer;
		this.stAgent = stAgent;
	}
	public int getStNo() {
		return stNo;
	}
	public void setStNo(int stNo) {
		this.stNo = stNo;
	}
	public String getStIp() {
		return stIp;
	}
	public void setStIp(String stIp) {
		this.stIp = stIp;
	}
	public String getStTime() {
		return stTime;
	}
	public void setStTime(String stTime) {
		this.stTime = stTime;
	}
	public String getStRefer() {
		return stRefer;
	}
	public void setStRefer(String stRefer) {
		this.stRefer = stRefer;
	}
	public String getStAgent() {
		return stAgent;
	}
	public void setStAgent(String stAgent) {
		this.stAgent = stAgent;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
}

