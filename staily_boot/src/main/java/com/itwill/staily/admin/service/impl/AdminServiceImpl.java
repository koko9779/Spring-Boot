
package com.itwill.staily.admin.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.staily.admin.mapper.AdminMapper;
import com.itwill.staily.admin.model.Stats;
import com.itwill.staily.admin.service.AdminService;
import com.itwill.staily.mypage.model.dto.Message;
import com.itwill.staily.util.Board;
import com.itwill.staily.util.Member;
import com.itwill.staily.util.Product;
import com.itwill.staily.util.Work;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper adminMapper;
	
	public AdminServiceImpl() {
	}
	
	

	public AdminServiceImpl(AdminMapper adminMapper) {
		super();
		this.adminMapper = adminMapper;
	}


	public AdminMapper getAdminMapper() {
		return adminMapper;
	}


	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}


	@Override
	public List<Member> selectMemberAll() {
		return adminMapper.selectMemberAll();
	}

	@Override
	public Member selectMemberOne(int mNo) throws Exception {
		return adminMapper.selectMemberOne(mNo);
	}

	@Override
	public boolean updateMember(Member member) throws Exception {
		return adminMapper.updateMember(member);
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public boolean deleteMember(int mNo) throws Exception {
		return adminMapper.deleteMember(mNo);
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public boolean createWork(Work work) throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String wDate = df.format(new Date());
		work.setwDate(wDate);
		boolean create = adminMapper.createWork(work);
		return create;
	}
	
//	@Override
//	public boolean createWorkDetail(Work work) throws Exception {
//		return createWorkDetail(work); 
//	}
	
	@Override
	public List<Work> selectWorkAll() throws Exception {
		return adminMapper.selectWorkAll();
	}

	@Override
	public Work selectWorkOne(int wNo) throws Exception {
		return adminMapper.selectWorkOne(wNo);
	}

	@Override
	public boolean updateWork(Work work) throws Exception {
		return adminMapper.updateWork(work);
	}
	@Override
	public boolean deleteWork(int wNo) throws Exception {
		return adminMapper.deleteWork(wNo);
	}

	@Override
	public List<Product> selectProductAll() throws Exception {
		return adminMapper.selectProductAll();
	}

	@Override
	public List<Product> selectProductOne(int pNo) throws Exception {
		return adminMapper.selectProductOne(pNo);
	}

	@Override
	@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public boolean updateProduct(Product product) throws Exception {
		boolean update = false ; 
		update = adminMapper.updateProduct(product);
//		if (updateOk) {
//			adminMapper.updateProductDetail(product);
//		}else {
//			throw new FailCreateException("업데이트에 실패하였습니다.");
//		}
		return update;
	}

//	@Override
//	public boolean updateProductDetail(Product product) throws Exception {
//		return adminMapper.updateProductDetail(product);
//	}
	
	@Override
	public boolean deleteProduct(int pNo) throws Exception {
		return adminMapper.deleteProduct(pNo);
	}

	@Override
	public boolean productConfirm(int pNo) {
		return adminMapper.productConfirm(pNo);
	}



	@Override
	public Product selectProductOnly(int pNo) throws Exception {
		return adminMapper.selectProductOnly(pNo);
	}


	@Override
	public List<Product> selectUnconfirmProduct() throws Exception {
		return adminMapper.selectUnconfirmProduct();
	}



	@Override
	public List<Board> selectBoardAll() throws Exception {
		return adminMapper.selectBoardAll();
	}



	@Override
	@Transactional(propagation = Propagation.REQUIRED , isolation = Isolation.READ_COMMITTED)
	public Board selectBoardOne(int bNo) throws Exception {
		adminMapper.updateView(bNo);
		return adminMapper.selectBoardOne(bNo);
	}



	@Override
	public boolean createNotice(Board board) throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String bDate = df.format(new Date());
		board.setbDate(bDate);
		board.setbCategory("N");
		boolean createOk = adminMapper.createNotice(board);
		return createOk;
	}



	@Override
	public boolean deleteNotice(int bNo) throws Exception {
		boolean deleteOk= adminMapper.deleteNotice(bNo);
		return deleteOk;
	}



	@Override
	public boolean updateNotice(Board board) throws Exception {
		boolean updateOk = adminMapper.updateNotice(board);
		return updateOk;
	}



	@Override
	public boolean createNoticeReply(Stats stats) throws Exception {
		return adminMapper.createNoticeReply(stats);
	}



	@Override
	public List<Stats> selectNoticeReply() throws Exception {
		List<Stats>replyList = new ArrayList();
		replyList = adminMapper.selectNoticeReply();
		return replyList;
	}



	@Override
	public boolean deleteNoticeReply(@Param("nrNo") int nrNo, @Param("mNo") int mNo) throws Exception {
		boolean deleteOk = adminMapper.deleteNoticeReply(nrNo, mNo);
		return deleteOk;
	}



	@Override
	public boolean rejectMessage(Message message) {
		return adminMapper.rejectMessage(message);
	}



	@Override
	public List<Product> selectPopProduct() {
		return adminMapper.popularProduct();
	}



	@Override
	public List<Work> selectPopWork() {
		return adminMapper.popularWork();
	}

	@Override
	public int countUnconfirm() {
		return adminMapper.countUncofirm();
	}



	@Override
	public List<Board> popularBoard() throws Exception {
		return adminMapper.popularBoard();
	}



	@Override
	public boolean createMessage(Message message) throws Exception {
		return adminMapper.createMessage(message);
	}










}
