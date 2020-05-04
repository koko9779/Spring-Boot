package com.itwill.staily.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.staily.admin.model.Stats;
import com.itwill.staily.mypage.model.dto.Message;
import com.itwill.staily.util.Board;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

public interface AdminService {
	/* 메인화면 */
	public List<Product> selectPopProduct() throws Exception;
	public List<Work> selectPopWork() throws Exception;
	public int countUnconfirm() throws Exception;
	public List<Board>popularBoard() throws Exception;
	// 회원 전체출력
	public List<Member> selectMemberAll() throws Exception;
	
	// 회원 개별출력
	public Member selectMemberOne(int mNo) throws Exception;

	// 회원 수정
	public boolean updateMember(Member member) throws Exception;

	// 회원삭제
	public boolean deleteMember(int mNo) throws Exception;
	
	//쪽지
	public boolean createMessage(Message message) throws Exception;

	/* 작품 */
	// 작품 입력
	public boolean createWork(Work work) throws Exception;

	// 작품 전체 출력
	public List<Work> selectWorkAll() throws Exception;

	// 작품 하나 출력
	public Work selectWorkOne(int wNo) throws Exception;

	// 작품수정
	public boolean updateWork(Work work) throws Exception;

	// 작품삭제
	public boolean deleteWork(int wNo) throws Exception;

	/* 상품 */
	// 상품 전체출력
	public List<Product> selectProductAll() throws Exception;

	// 상품 하나출력
	public List<Product> selectProductOne(int pNo) throws Exception;

	// 상품 수정
	public boolean updateProduct(Product product) throws Exception;

	// 상품 삭제
	public boolean deleteProduct(int pNo) throws Exception;


	// 상품만 출력(하나)
	public Product selectProductOnly(int pNo) throws Exception;

	// 승인안된상품 출력(전체)
	public List<Product> selectUnconfirmProduct() throws Exception;
	
	// 상품 승인
	public boolean productConfirm(int pNo)throws Exception;
	
	//승인 거부
	public boolean rejectMessage(Message message);
		
	//공지사항 전체 출력 
	public List<Board>selectBoardAll() throws Exception;
	
	//공지사항 하나 출력 
	public Board selectBoardOne(int bNo) throws Exception;
	
	//공지사항 작성
	public boolean createNotice(Board board) throws Exception;
	//공지사항 삭제 
	public boolean deleteNotice(int bNo)throws Exception;
	//공지사항 수정
	public boolean updateNotice(Board board) throws Exception;
	
	//공지사항 댓글 작성
	public boolean createNoticeReply(Stats stats) throws Exception;
	
	//공지사항 댓글 리스트
	public List<Stats>selectNoticeReply() throws Exception;
	
	//공지사항 댓글 삭제
	public boolean deleteNoticeReply(@Param("nrNo") int nrNo, @Param("mNo") int mNo) throws Exception;
}
