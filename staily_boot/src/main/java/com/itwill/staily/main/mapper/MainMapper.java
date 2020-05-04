package com.itwill.staily.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

@Mapper
public interface MainMapper {
	/*
	 	1. 즐겨찾기한 상품 출력
		2. HOT 상품 출력
		3. TODAY 작품 출력
		4. 카테고리별 작품 출력
	 */
	public List<Bookmark> selectByBookmark(int mNo);
	public List<Product> selectByView();
	public List<Work> selectTodayOfWork();
	public List<Work> selectByCategory(String category);

}