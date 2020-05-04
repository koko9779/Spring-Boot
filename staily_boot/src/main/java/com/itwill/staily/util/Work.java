package com.itwill.staily.util;

import java.util.List;

/*
W_NO	NUMBER	No		1	작품번호
W_NAME	VARCHAR2(50 BYTE)	Yes		2	작품이름
W_CATEGORY	CHAR(1 BYTE)	Yes		3	작품카테고리
W_DATE	VARCHAR2(12 BYTE)	Yes		4	작품날짜
W_POSTER	VARCHAR2(200 BYTE)	Yes		5	작품포스터
W_TEPISODE	NUMBER	Yes		6	작품전체회차
W_VIEW	NUMBER	Yes		7	작품조회수
*/
public class Work {
	// 작품
	private int wNo;
	private String wName;
	private String wCategory;
	private String wDate;
	private String wPoster;
	private int wTepisode;
	private int wView;
	private String wVideo;
	// 작품상세
	private int wdNo;
	private int wdEpisode;
	private List<Product> product;

	public Work() {
		// TODO Auto-generated constructor stub
	}

	public Work(int wNo, String wName, String wCategory, String wDate, String wPoster, int wTepisode, int wView) {
		super();
		this.wNo = wNo;
		this.wName = wName;
		this.wCategory = wCategory;
		this.wDate = wDate;
		this.wPoster = wPoster;
		this.wTepisode = wTepisode;
		this.wView = wView;
	}

	public Work(int wNo, String wName, String wCategory, String wDate, String wPoster, int wTepisode, int wView,
			int wdNo, int wdEpisode, List<Product> product) {
		super();
		this.wNo = wNo;
		this.wName = wName;
		this.wCategory = wCategory;
		this.wDate = wDate;
		this.wPoster = wPoster;
		this.wTepisode = wTepisode;
		this.wView = wView;
		this.wdNo = wdNo;
		this.wdEpisode = wdEpisode;
		this.product = product;
	}
	
	public Work(int wNo, String wName, String wCategory, String wDate, String wPoster, int wTepisode, int wView,
			String wVideo) {
		super();
		this.wNo = wNo;
		this.wName = wName;
		this.wCategory = wCategory;
		this.wDate = wDate;
		this.wPoster = wPoster;
		this.wTepisode = wTepisode;
		this.wView = wView;
		this.wVideo = wVideo;
	}

	public int getWdNo() {
		return wdNo;
	}

	public void setWdNo(int wdNo) {
		this.wdNo = wdNo;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Work [wNo=" + wNo + ", wName=" + wName + ", wCategory=" + wCategory + ", wDate=" + wDate + ", wPoster="
				+ wPoster + ", wTepisode=" + wTepisode + ", wView=" + wView + ", wdNo=" + wdNo + ", wdEpisode="
				+ wdEpisode + ", product=" + product + "]";
	}

	public int getWdEpisode() {
		return wdEpisode;
	}

	public void setWdEpisode(int wdEpisode) {
		this.wdEpisode = wdEpisode;
	}

	public int getwNo() {
		return wNo;
	}

	public void setwNo(int wNo) {
		this.wNo = wNo;
	}

	public String getwName() {
		return wName;
	}

	public void setwName(String wName) {
		this.wName = wName;
	}

	public String getwCategory() {
		return wCategory;
	}

	public void setwCategory(String wCategory) {
		this.wCategory = wCategory;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getwPoster() {
		return wPoster;
	}

	public void setwPoster(String wPoster) {
		this.wPoster = wPoster;
	}

	public int getwTepisode() {
		return wTepisode;
	}

	public void setwTepisode(int wTepisode) {
		this.wTepisode = wTepisode;
	}

	public int getwView() {
		return wView;
	}

	public void setwView(int wView) {
		this.wView = wView;
	}

	public String getwVideo() {
		return wVideo;
	}

	public void setwVideo(String wVideo) {
		this.wVideo = wVideo;
	}

}
