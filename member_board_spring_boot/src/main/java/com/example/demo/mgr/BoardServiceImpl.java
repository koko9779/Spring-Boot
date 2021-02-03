package com.example.demo.mgr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.BoardDao;
import com.example.demo.dto.Board;
import com.example.demo.dto.Pagination;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<Board> getBoardList(Pagination pagination) throws Exception {
		List<Board> boardList = boardDao.getBoardList(pagination);
		return boardList;
	}

	@Override
	public int getBoardListCnt() throws Exception {
		int listCnt = boardDao.getBoardListCnt();
		return listCnt;
	}
	
	@Override
	public void insertBoard(Board board) throws Exception {
		boardDao.insertBoard(board);	
	}
	
	//@Transactional Isolation.READ_COMMITTED
	//어떠한 사용자가 A라는 데이터를 B라는 데이터로 변경하는 동안 다른 사용자는 해당 데이터에 접근할 수 없다.
	//dirty read 방지 : 트랜잭션이 커밋되어 확정된 데이터만을 읽는 것을 허용
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Board getBoardDetail(int boardnum) throws Exception {
		boardDao.updateBoardReadcount(boardnum);		//조회수 증가
		Board board = boardDao.getBoardDetail(boardnum);
		return board;
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		boardDao.updateBoard(board);	
	}

	@Override
	public void deleteBoard(int boardnum) throws Exception {
		boardDao.deleteBoard(boardnum);
	}

	@Override
	public void updateBoardReadcount(int boardnum) throws Exception {
		boardDao.updateBoardReadcount(boardnum);
	}
	
	
}
