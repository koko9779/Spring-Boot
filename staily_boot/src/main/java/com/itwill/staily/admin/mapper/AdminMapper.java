package com.itwill.staily.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.itwill.staily.admin.model.Stats;
import com.itwill.staily.mypage.model.dto.Message;
import com.itwill.staily.util.Board;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

@Repository("adminMapper")
@Mapper
public interface AdminMapper {
	/* 메인화면 */
	public List<Product>popularProduct();
	public List<Work>popularWork();
	public List<Board>popularBoard();
	public int countUncofirm();
	/* 회원 */
	
	//회원 전체출력
	public List<Member> selectMemberAll();
	//회원 개별출력
	public Member selectMemberOne(int mNo);
	//회원 수정
	public boolean updateMember(Member member);
	//회원삭제
	public boolean deleteMember(int mNo);
	//쪽지
	public boolean createMessage(Message message);
	/* 작품 */
	//작품 입력
	public boolean createWork(Work work);
	//작품상세 입력
	public boolean createWorkDetail(Work work);
	//작품 전체 출력
	public List<Work>selectWorkAll();
	//작품 하나 출력
	public Work selectWorkOne(int wNo); 
	//작품수정
	public boolean updateWork(Work work);
	//작품삭제
	public boolean deleteWork(int wNo);
	
	
	/* 상품 */
	//상품 전체출력
	public List<Product>selectProductAll();
	//상품 하나출력
	public List<Product> selectProductOne(int pNo);
	//상품만 출력(하나)
	public Product selectProductOnly(int pNo);
	//승인안된 상품 출력(전체)
	public List<Product> selectUnconfirmProduct();
	//상품 수정
	public boolean updateProduct(Product product);
	//상품상세 수정
	public boolean updateProductDetail(Product product);
	//상품 삭제
	public boolean deleteProduct(int pNo);
	//상품 승인 
	public boolean productConfirm(int pNo);
	//승인 거부
	public boolean rejectMessage(Message message);
	
	/* 공지사항 */
	//공지사항 작성
	public boolean createNotice(Board board);
	//공지사항 출력 
	public List<Board>selectBoardAll();
	//공지사항 하나 출력
	public Board selectBoardOne(int bNo);
	//공지사항 삭제 
	public boolean deleteNotice(int bNo);
	//공지사항 수정
	public boolean updateNotice(Board board);
	//공지사항 조회수 증가
	public boolean updateView(int bNo);
	//공지사항 댓글
	public boolean createNoticeReply(Stats stats);
	
	public List<Stats>selectNoticeReply();
	
	public boolean deleteNoticeReply(@Param("nrNo") int nrNo, @Param("mNo") int mNo);
	
	
}
