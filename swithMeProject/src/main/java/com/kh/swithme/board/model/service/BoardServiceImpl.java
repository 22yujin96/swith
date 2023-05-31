package com.kh.swithme.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.board.model.dao.BoardDao;
import com.kh.swithme.board.model.vo.Board;
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
	
}
