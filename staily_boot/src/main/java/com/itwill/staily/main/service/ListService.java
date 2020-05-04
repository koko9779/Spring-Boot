package com.itwill.staily.main.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

public interface ListService {
	//작품상세페이지 작품정보(작품이름,작품 포스터) 출력 
	public Work selectWorkOne(int wNo);
	//총회차 출력
	public int selectTepisode(int wNo);
	//작품상세페이지 상품리스트 출력(기업)
	public List<Work> selectCProductList(int wNo) throws Exception;
	//작품상세페이지 상품리스트 출력(일반)
	//public List<Work> selectMProductList(int wNo) throws Exception;
	public List<Work> selectMProductList(@Param("wNo") int wNo,@Param("start") int start,@Param("end") int end) throws Exception;
	//작품상세페이지 상품리스트 회차별 출력(기업)
	public List<Work> selectCProductListByEpisode(Map map) throws Exception;
	//작품상세페이지 상품리스트 회차별 출력(일반)
	public List<Work> selectMProductListByEpisode(Map map) throws Exception;
			
	//즐겨찾기 등록	
	public int createBookmark(Map map) throws Exception;
	//즐겨찾기 제거
	public int deleteBookmark(int bmNo) throws Exception;
	//즐겨찾기 번호 찾기
	public int selectBookmarkNo(@Param("mNo") int mNo,@Param("pNo") int pNo) throws Exception;
	//게시물 총 건수
	public int selectProductCount(int wNo) throws Exception;
	//에피소드별 게시물 총 건수
	public int selectProductCountByEpisode(@Param("wNo") int wNo,@Param("wdEpisode") int wdEpisode) throws Exception;
	
	//작품 조회수 증가
	public void increaseWorkView(int wNo) throws Exception;
	
	//전체 상품 리스트
	public List<Work> selectProductList() throws Exception;
}
