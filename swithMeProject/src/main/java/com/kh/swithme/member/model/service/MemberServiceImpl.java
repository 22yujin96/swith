package com.kh.swithme.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.member.model.dao.MemberDao;
import com.kh.swithme.member.model.vo.Member;

/**
 * @author user1
 *
 */
/**
 * @author user1
 *
 */
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 *아이디 중복체크
	 */
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	/**
	 *닉네임 중복체크
	 */
	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}
	/**
	 *이메일 중복체크
	 */
	@Override
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession,checkEmail);
	}
	/**
	 *회원가입
	 */
	@Override
	public int joinMember(Member m) {
		return memberDao.joinMember(sqlSession, m);
	}
	
	/**
	 *회원가입시 포인트 insert
	 */
	@Override
	public int joinPoint(Member m) {
		return memberDao.joinPoint(sqlSession, m);
	}
	
	/**
	 *로그인 select
	 */
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	/**
	 *로그인 시 포인트 지급
	 */
	@Override
	public int loginPoint(Member m) {
		return memberDao.loginPoint(sqlSession, m);
	}
	
	
	
	
	
	
	
	
	

}
