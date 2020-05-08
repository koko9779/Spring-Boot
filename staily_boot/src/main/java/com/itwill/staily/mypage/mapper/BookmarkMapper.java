package com.itwill.staily.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.staily.mypage.model.dto.Bookmark;
@Mapper
public interface BookmarkMapper {
	
	//북마크 리스트출력
	public List<Bookmark> selectList(int mNo) throws Exception;
		
	//북마크 삭제
	public boolean deleteBookmark(int bmNo) throws Exception;
	
	
}
