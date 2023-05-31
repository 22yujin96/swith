package com.kh.swithme.board.model.service;

import java.util.ArrayList;

import com.kh.swithme.board.model.vo.Board;
import com.kh.swithme.common.model.vo.PageInfo;

public interface BoardService {

	
	
	// 1. 리스트 카운트
	int boardListCount(int boardType);
	
	// 2. 리스트 불러오기
	ArrayList<Board> selectBoardList(int boardType, PageInfo pi);
		
		
}
