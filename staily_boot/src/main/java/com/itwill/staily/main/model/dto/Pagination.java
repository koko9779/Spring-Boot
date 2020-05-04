package com.itwill.staily.main.model.dto;

public class Pagination {
	
    /** 한 페이지당 게시글 수 **/
    private int pageSize = 3;       
    /** 현재 페이지 **/
    private int curPage = 1;    
    /** 총 게시글 수 **/
    private int listCnt;    
    /** 총 페이지 수 **/
    private int pageCnt;    
    /** 시작 페이지 **/
    private int startPage = 1;    
    /** 끝 페이지 **/
    private int endPage = 1;    
    /** 시작 index **/
    private int startIndex = 1;    
    /** 현재 페이지의 마지막 게시물 **/
    private int curEndIndex =1;

	/** 마지막 index **/
    private int endIndex = 1;
    
    public Pagination(int listCnt, int curPage){
        
        // 총 게시물 수와 현재 페이지를 Controller로 부터 받아온다.
    	
        /** 현재페이지 **/
    	this.curPage = curPage;
        /** 총 게시물 수 **/
        this.listCnt = listCnt;
        /** 총 페이지 수 **/
        setPageCnt(listCnt);
        setStartIndex(curPage);
        setCurEndIndex(curPage);
    	setEndIndex(listCnt);
    	setEndPage(pageCnt);
    }
 
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurPage() {
		return curPage;
	}
	
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

    public void setPageCnt(int listCnt) {
        this.pageCnt = listCnt/pageSize +1;
    }

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int pageCnt) {
		this.endPage = pageCnt;
	}

	public int getStartIndex() {
		return startIndex;
	}

    public void setStartIndex(int curPage) {
        this.startIndex = (curPage-1) * pageSize + 1;
    }
    
    public int getCurEndIndex() {
		return curEndIndex;
	}

	public void setCurEndIndex(int curPage) {
		this.curEndIndex = curPage*pageSize;
	}
	
    public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int listCnt) {
		this.endIndex = listCnt;
	}

}
