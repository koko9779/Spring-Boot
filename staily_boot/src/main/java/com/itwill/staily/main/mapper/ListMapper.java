package com.itwill.staily.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

@Mapper
public interface ListMapper {
	/*
	//WorkDetailMapper
	1-1.작품상세페이지 작품정보(작품이름,작품 포스터) 출력 
	1-2.총회차 출력
	
	2.작품상세페이지 상품리스트 출력(기업)
	3.작품상세페이지 상품리스트 출력(일반)
	4.작품상세페이지 상품리스트 회차별 출력(기업)
	5.작품상세페이지 상품리스트 회차별 출력(일반)
			
	6.즐겨찾기 등록	
	7.즐겨찾기 제거
	8.즐겨찾기 번호찾기
	
	9.게시물 총 건수
	10.에피소드별 게시물 총 건수
	
	11.전체 상품 리스트
	 */

	public List<Work> selectCProductList(int wNo);
	//public List<Work> selectMProductList(int wNo);
	public List<Work> selectMProductList(@Param("wNo") int wNo,@Param("start") int start,@Param("end") int end);
	public List<Work> selectCProductListByEpisode(Map map);
	public List<Work> selectMProductListByEpisode(Map map);
		
	public int createBookmark(Map map);
	public int deleteBookmark(int bmNo);
	public int selectBookmarkNo(@Param("mNo") int mNo,@Param("pNo") int pNo);
	
	public int selectProductCount(int wNo);
	public int selectProductCountByEpisode(@Param("wNo") int wNo,@Param("wdEpisode") int wdEpisode);
	
	public List<Work> selectProductList();
}
