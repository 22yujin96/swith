package com.kh.swithme.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.SRoomReview;
import com.kh.swithme.board.model.vo.StudyRoom;
import com.kh.swithme.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	
	//혜린 -----------------------------------------------------------------------------------
	public int boardListCount(SqlSessionTemplate sqlSession, int boardType) {
		return sqlSession.selectOne("boardMapper.boardListCount", boardType);
	}
	public ArrayList<Board> boardListSelect(SqlSessionTemplate sqlSession, PageInfo pi, int boardType){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.boardListSelect", boardType, rowBounds);
	}
	public int freeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.freeCount");
	}
	
	
	
	
	// 희재 스터디룸 ------------------------------------------------------------------------
	public int sRoomListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.sRoomListCount");
	}
	
	public ArrayList<StudyRoom> selectSRoomList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectSRoomList", rowBounds);
	}
	
	public StudyRoom selectStudyRoom(SqlSessionTemplate sqlSession, int studyRoomNo) {
		return sqlSession.selectOne("boardMapper.selectStudyRoom", studyRoomNo);
	}
	
	public ArrayList<SRoomReview> selectStudyRoomReviewList(SqlSessionTemplate sqlSession, int studyRoomNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectStudyRoomReviewList", studyRoomNo);
	}
	
}
