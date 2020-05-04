package com.itwill.staily.main.service;

import java.util.List;
import java.util.Map;

import com.itwill.staily.mypage.model.dto.Bookmark;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

public interface MainService {
		
 	//즐겨찾기한 상품 출력
	public List<Bookmark> selectByBookmark(int mNo) throws Exception;
	//HOT 상품 출력
	public List<Product> selectByView() throws Exception;
	//TODAY 작품 출력
	public List<Work> selectTodayOfWork() throws Exception;		
	//카테고리별 작품 출력
	public List<Work> selectByCategory(String category) throws Exception;

}
