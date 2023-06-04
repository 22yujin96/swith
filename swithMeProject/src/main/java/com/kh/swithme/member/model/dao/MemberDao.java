package com.kh.swithme.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.member.model.vo.Member;

@Repository
public class MemberDao {

	
	//지현
	
	//아이디 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	//닉네임 중복체크
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	// 이메일 중복체크
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("memberMapper.emailCheck",checkEmail);
	}
	public int joinMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.joinMember", m);
	}
	public int joinPoint(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.joinPoint", m);
	}
	
	
	
	
	
	
	

}
