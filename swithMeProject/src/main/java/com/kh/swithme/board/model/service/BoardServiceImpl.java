package com.kh.swithme.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.board.model.dao.BoardDao;
import com.kh.swithme.board.model.vo.Attach;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.SRoomReview;
import com.kh.swithme.board.model.vo.StudyRoom;
import com.kh.swithme.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
	
	// 혜린
	
	@Override
	public int boardListCount(int boardType) {
		return boardDao.boardListCount(sqlSession, boardType);
	}

	@Override
	public ArrayList<Board> selectBoardList(int boardType, PageInfo pi) {
		return boardDao.boardListSelect(sqlSession, pi, boardType);
	}
	
	@Override
	public int freeCount() {
		return boardDao.freeCount(sqlSession);
	}

	
	
	// 희재 - 스터디룸 
	
	@Override
	public int sRoomListCount() {
		return boardDao.sRoomListCount(sqlSession);
	}

	@Override
	public ArrayList<StudyRoom> selectSRoomList(PageInfo pi) {
		return boardDao.selectSRoomList(sqlSession, pi);
	}

	@Override
	public ArrayList<Attach> selectSRoomAttachList(int studyRoomNo) {
		return null;
	}

	@Override
	public StudyRoom selectStudyRoom(int studyRoomNo) {
		return boardDao.selectStudyRoom(sqlSession, studyRoomNo);
	}

	@Override
	public ArrayList<SRoomReview> selectStudyRoomReviewList(int studyRoomNo) {
		return boardDao.selectStudyRoomReviewList(sqlSession, studyRoomNo);
	}

	@Override
	public int insertStudyRoomReview(SRoomReview sr) {
		return 0;
	}
	
}
