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
	// 회원가입
	public int joinMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.joinMember", m);
	}
	//회원가입 시 포인트
	public int joinPoint(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.joinPoint", m);
	}
	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}
	//로그인 시 포인트
	public int loginPoint(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.loginPoint");
	}
	
	
	
	
	
	
	

}
