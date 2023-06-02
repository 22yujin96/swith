package com.kh.swithme.board.model.service;

import java.util.ArrayList;

import com.kh.swithme.board.model.vo.Attach;
import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.board.model.vo.SRoomReview;
import com.kh.swithme.board.model.vo.StudyRoom;
import com.kh.swithme.common.model.vo.PageInfo;

public interface BoardService {

	
	int freeCount();
	
	// 1. 리스트 카운트
	int boardListCount(int boardType);
	
	// 2. 리스트 불러오기
	ArrayList<Board> selectBoardList(int boardType, PageInfo pi);
	
	
	
	//// ------------------희재 - 스터디룸 
	// 스터디룸 리스트 카운트
	int sRoomListCount();
	
	// 스터디룸 리스트 불러오기
	ArrayList<StudyRoom> selectSRoomList(PageInfo pi);
	
	// 스터디룸 대표이미지 불러오기
	ArrayList<Attach> selectSRoomAttachList(int studyRoomNo);
	
	// 스터디름 상세 정보 보기 
	StudyRoom selectStudyRoom(int studyRoomNo);
	
	// 댓글(후기) 불러오기
	ArrayList<SRoomReview> selectStudyRoomReviewList(int studyRoomNo);
	
	// 댓글(후기) 작성하기
	int insertStudyRoomReview(SRoomReview sr);
	
	
	
	
	
		
}
