package com.kh.swithme.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.board.model.vo.Board;
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
	
	
}
