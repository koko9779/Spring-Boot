package com.itwill.staily.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.staily.util.Company;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;

public interface MypageMapper {
	
	//멤버 하나 선택
	public Member selectOne(int mNo) throws Exception;
	
	//멤버 삭제
	public boolean deleteMember(int mNo) throws Exception;
	
	//멤버 수정
	public boolean updateMember(Member member) throws Exception;
	
	//멤버 선택 (회사정보포함)
	public Member selectMemberCompany(int mNo) throws Exception;

	//내가 쓴글 리스트출력
	public List<Product> selectWriteList(int mNo) throws Exception;
	
	//내가 쓴글 삭제
	public boolean deleteWrite(int pNo) throws Exception;
	
	//회사 co_no수정
	public boolean updateCompanyNo(@Param("coNo") int coNo, @Param("mNo") int mNo) throws Exception;
}
